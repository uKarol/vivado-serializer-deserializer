`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2019 18:42:51
// Design Name: 
// Module Name: serializer_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// Vivado z³om 

module serializer_test(
    );
    
    localparam 
        CLOCK_PERIOD = 10,
        PCLK_PERIOD = 160,
        OVERSAMPLING_SAMPLES = 1,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES,        
        FRAME_SIZE = 31,
        FRAME_NUMBER = 4,
        TEST_IDLE = 0,
        TEST_PROCESSING = 1,
        FIRST_BIT_TEST = 2,
        TEST_ERROR = 3;
    
    reg pclk;
    reg clock;
    reg reset;
    reg req;
    reg [31:0]data_in;
    reg [2:0]crc_in;
    reg [3:0]alu_flags_in;
    reg crc_error;
    reg data_error;
    reg op_error;
    wire serial_out;
    wire ack_out;

    
    integer i; // loop counter
    integer j;
    integer k;
    
    integer ok_bits;
    integer failed_bits;
    
   // serial frame format: [ 0, packet type, packet pits, stop ] 
    reg [FRAME_SIZE:0]data_template_1 [FRAME_NUMBER:0];
    reg [3:0]flags_template_1 [FRAME_NUMBER:0];
    reg [2:0]crc_template_1 [FRAME_NUMBER:0];
    
    reg [2:0]error_template [2:0];  

    reg [5:0]error_frame;
        // test variables

    
    serializer_core DUT(
        .clk(clock),
        .rst(reset),
        .req(req),
        .data_in(data_in),
        .crc_in(crc_in),
        .alu_flags_in(alu_flags_in),
        .serial_out(serial_out),
        .ack(ack_out),
        .data_err_in(data_error),
        .crc_err_in(crc_error),
        .op_err_in(op_error)
        );
        
        reg [54:0]serializer_out;
        reg [1:0]test_state;
        reg [8:0]bit_ctr;
        reg [2:0]errors;
    always @(posedge pclk)
    begin
    
        case(test_state)
        TEST_IDLE:
        begin
            if( serial_out == 0) begin
             test_state = FIRST_BIT_TEST;
             serializer_out[54] = serial_out;
             end
            else test_state = TEST_IDLE;
            bit_ctr = 0;
            
        end
        FIRST_BIT_TEST:
        begin 
            bit_ctr = 0;
            serializer_out[53] = serial_out;
            if( serial_out == 0 ) test_state = TEST_PROCESSING;
            else test_state = TEST_ERROR;      
            
        end
        TEST_ERROR:
        begin
            
            serializer_out[52-bit_ctr] = serial_out;           
            bit_ctr = bit_ctr + 1;
            if(bit_ctr < 10)begin
             test_state = TEST_ERROR;
            end 
            else begin
             test_state = TEST_IDLE;
             errors = serializer_out[51:49];
            end
            
        end
        
        TEST_PROCESSING:
        begin
            serializer_out[52-bit_ctr] = serial_out;           
             bit_ctr = bit_ctr + 1;
            if(bit_ctr < 53) test_state = TEST_PROCESSING;
            else test_state = TEST_IDLE;
        end
        endcase
        
    end
        initial 
        begin
            // TEST 1 ARRAYS INIT
            ok_bits = 0;
            failed_bits = 0;
            
            
            error_template[0] = 3'b001;
            error_template[1] = 3'b010;
            error_template[2] = 3'b100;
            
            data_template_1[0] = 32'b1010_1010_1010_1010_1010_1010_1010_1010; // valid frame
            flags_template_1[0] = 4'b0101;
            crc_template_1[0] = 3'b010;
            
            data_template_1[1] = 32'b1111_0010_1011_0101_1010_1010_0001_1101; // valid frame
            flags_template_1[1] = 4'b0110;
            crc_template_1[1] = 3'b100;
            
            data_template_1[2] = 32'b1010_1010_1000_1011_0001_0010_1110_1010; // valid frame
            flags_template_1[2] = 4'b0011;
            crc_template_1[2] = 3'b011;
            
            data_template_1[3] = 32'b1110_1011_1010_1011_0001_0001_0010_1010; // valid frame
            flags_template_1[3] = 4'b0011;
            crc_template_1[3] = 3'b011;

        
        end 
        
        
    
        initial 
        begin 
             serializer_out = 0;
             test_state = 0;
             bit_ctr = 0;
             clock = 1; 
             pclk = 1;
             reset = 1;
             #(3*PCLK_PERIOD) reset = 0;
        end 
           
           // clock generation  
        always 
        begin
            #(CLOCK_PERIOD/2)  clock =  ! clock; 

        end
        
        always
        begin
            #(PCLK_PERIOD/2) pclk = !pclk;
        end
            
        initial 
        begin
        
        #(4*PCLK_PERIOD);

        
        $display("SERIALIZER TEST START");
  // NO ERROR TESTS          
for(k = 0; k< 4; k=k+1) begin   
           
        data_in = data_template_1[k];
        alu_flags_in = flags_template_1[k];
        crc_in = crc_template_1[k];
        
        crc_error = 0;
        data_error = 0;
        op_error = 0;
        
        req = 1;
        
                
            #(PCLK_PERIOD) req = 0;
        
            #(1000*PCLK_PERIOD); 
            $display("%b", serializer_out);
            $display("%b", {serializer_out[52: 45], serializer_out[41: 34], serializer_out[30: 23], serializer_out[19: 12]} );
            if(data_template_1[k] == {serializer_out[52: 45], serializer_out[41: 34], serializer_out[30: 23], serializer_out[19: 12]} ) $display("DATA_OK");
            else $display("DATA_NOT_OK");
            
            if( flags_template_1[k] == serializer_out[7:4] ) $display("flags OK");
            else $display("flags_not_ok");
                                        /* 54 52 
                                         52 51 50 49 48 47 46 45
                                         44 43 42
                                         41 40 39 38 37 36 35 34
                                         33 32 31
                                         30 29 28 27 26 25 24 23
                                         22 21 20 
                                         19 18 17 16 15 14 13 12
                                         11 10 9
                                         8  7  6  5  4  3  2  1
                                         0*/
           
                                         
end        

// ERRORS TESTS

for(k = 0; k< 3; k=k+1) begin   

        // #(4*PCLK_PERIOD); 
        error_frame = {error_template[k], error_template[k]};
           
        data_in = data_template_1[k];
        alu_flags_in = flags_template_1[k];
        crc_in = crc_template_1[k];        
        crc_error = error_template[k][2];
        op_error = error_template[k][1];
        data_error = error_template[k][0];               

        #(1000*PCLK_PERIOD);
        if( errors == error_template[k] ) $display("ok");
        else $display ("not ok");
        #(PCLK_PERIOD);                             
    
        reset = 1;
        #(PCLK_PERIOD);
        reset = 0;
    
end            
            
        $display("SERIALIZER TEST FINISH");
        
        
            $finish;
        end     
endmodule
