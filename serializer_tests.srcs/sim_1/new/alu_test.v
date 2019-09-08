`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2019 21:08:38
// Design Name: 
// Module Name: alu_test
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


module alu_test( );
    reg clock, serial_data, reset; 
    wire [31:0] result;
    wire [31:0] data_out_B;
    wire ack_test;
    wire frame_error; 
    wire crc_error;
    wire op_err;
    
    wire ack_alu;
    wire [3:0] flag_test;
    wire [2:0] crc_test;
    
    wire serial_out;

 mtm_ALU DUT(
    .clk(clock),
    .rst(reset),
    .sin(serial_data),
    .sout(serial_out),
    // temporary
    .result(result),
    .crc_out(crc_test),
    .flags_out(flag_test),
    .data_error(frame_error),
    .crc_error(crc_error),
    .op_err(op_err),
    .ack_alu(ack_alu)
    
    );

localparam 
    CLOCK_PERIOD = 10,
    OVERSAMPLING_SAMPLES = 16,
    BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES,        
    FRAME_SIZE = 10,
    BYTE_SIZE = 7,
    FRAME_NUMBER = 8,
    DATA_SIZE = 31,
    PCLK_PERIOD = 160,
    TEST_IDLE = 0,
    TEST_PROCESSING = 1,
    FIRST_BIT_TEST = 2,
    TEST_ERROR = 3;

reg pclk;

integer i; // loop counter
integer j;
// serial frame format: [ 0, packet type, packet pits, stop ] 
reg [DATA_SIZE:0]serial_template_A [FRAME_NUMBER:0];
reg [DATA_SIZE:0]serial_template_B [FRAME_NUMBER:0];
reg [BYTE_SIZE:0]ctl_template[FRAME_NUMBER:0];
 
reg [BYTE_SIZE:0]serial_template_2 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE:0]serial_template_3 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE:0]serial_template_4 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE:0]serial_template_5 [FRAME_NUMBER:0];
reg [BYTE_SIZE:0]serial_template_6 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE:0]serial_template_7 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE+1:0]serial_template_8 [FRAME_NUMBER:0]; 
reg [BYTE_SIZE:0]serial_template_9 [FRAME_NUMBER:0]; 

// DATA FRAMES 

initial
begin
    
    // TEST 1 ARRAYS INIT
    serial_template_A[0] = 32'b1010_1010_1111_0000_1100_1100_0011_0101;
    serial_template_B[0] = 32'B1001_0101_0000_0101_0001_0100_0010_1111;
    ctl_template[0] = 8'b0;
    
    //TEST 2 ARRAYS INIT
    
    serial_template_A[1] = 32'b1010_1010_1111_0010_1101_1100_1011_0101;
    serial_template_B[1] = 32'b1001_0101_1000_0101_0101_0100_1010_1011;
    ctl_template[1] = 8'b0;
           
    //TEST 3 ARRAYS INIT
    
    serial_template_A[2] = 32'b0001_1101_0100_1010_1001_0100_0001_0010; // valid frame 12 
    serial_template_B[2] = 32'b0011_1001_1011_1100_1110_1001_0100_0000; // valid frame 40
    ctl_template[2] = 8'b0;
            
    //TEST 4 ARRAYS INIT
    
    serial_template_4[0]  = 8'b0001_1101; // valid frame 
    serial_template_4[1]  = 8'b0100_1010; // valid frame
    serial_template_4[2]  = 8'b1001_0100; // valid frame 
    serial_template_4[3]  = 8'b0001_0010; // valid frame 
    serial_template_4[4]  = 8'b0011_1001; // valid frame 
    serial_template_4[5]  = 8'b1011_1100; // valid frame 
    serial_template_4[6]  = 8'b1110_1001; // valid frame 
    serial_template_4[7]  = 8'b0100_0000; // valid frame 
    serial_template_4[8]  = 8'b0_011_0110; // invalid command frame
    
    // TEST 5 ARRAYS INIT - too few frames

    serial_template_5[0] = 8'b1010_1010; // valid frame
    serial_template_5[1] = 8'b1111_0000; // valid frame
    serial_template_5[2] = 8'b1100_1100; // valid frame 
    serial_template_5[3] = 8'b0011_0101; // valid frame 
    serial_template_5[4] = 8'b1001_0101; // valid frame 
    serial_template_5[5] = 8'b0000_0101; // valid frame 
    serial_template_5[6] = 8'b0001_0100; // valid frame  
    serial_template_5[7] = 8'b1_000_1010; // valid frame
    
    //TEST 6 ARRAYS INIT 
    
    serial_template_6[0]  = 8'b1010_1010; // invalid stop bit
    serial_template_6[1]  = 8'b1111_0010; // valid frame
    serial_template_6[2]  = 8'b1101_1100; // valid frame 
    serial_template_6[3]  = 8'b1011_0101; // valid frame 
    serial_template_6[4]  = 8'b1001_0101; // valid frame 
    serial_template_6[5]  = 8'b1000_0101; // valid frame 
    serial_template_6[6]  = 8'b0101_0100; // valid frame 
    serial_template_6[7]  = 8'b1010_1011; // valid frame 
    serial_template_6[8]  = 8'b0_101_1011; // invalid command frame
           
    //TEST 7 ARRAYS INIT
    
    serial_template_7[0]  = 8'b0001_1101; // valid frame
    serial_template_7[1]  = 8'b0100_1010; // valid frame
    serial_template_7[2]  = 8'b1001_0100; // valid frame 
    serial_template_7[3]  = 8'b0001_0010; // valid frame 
    serial_template_7[4]  = 8'b0011_1001; // invalid data frame 
    serial_template_7[5]  = 8'b1011_1100; // valid frame 
    serial_template_7[6]  = 8'b1110_1001; // valid frame 
    serial_template_7[7]  = 8'b0100_0000; // valid frame 
    serial_template_7[8]  = 8'b0_001_0110; // valid frame
            
    //TEST 8 ARRAYS INIT - too many frames
    
    serial_template_8[0]  = 8'b0001_1101; // valid frame
    serial_template_8[1]  = 8'b0100_1010; // valid frame
    serial_template_8[2]  = 8'b1001_0100; // valid frame 
    serial_template_8[3]  = 8'b0001_0010; // valid frame 
    serial_template_8[4]  = 8'b0011_1001; // valid frame 
    serial_template_8[5]  = 8'b1011_1100; // valid frame 
    serial_template_8[6]  = 8'b1110_1001; // valid frame 
    serial_template_8[7]  = 8'b0100_0000; // valid frame 
    serial_template_8[8]  = 8'b0100_0000; // additional valid frame
    serial_template_8[9]  = 8'b1_001_0110; // valid command frame
    
   //TEST 9 ARRAYS INIT
    
    serial_template_9[0]  = 8'b0001_1101; // valid frame
    serial_template_9[1]  = 8'b0100_1010; // valid frame
    serial_template_9[2]  = 8'b1001_0100; // valid frame 
    serial_template_9[3]  = 8'b0001_0010; // valid frame 
    serial_template_9[4]  = 8'b0011_1001; // valid frame 
    serial_template_9[5]  = 8'b1011_1100; // valid frame 
    serial_template_9[6]  = 8'b1110_1001; // valid frame 
    serial_template_9[7]  = 8'b0100_0000; // valid frame 
    serial_template_9[8]  = 8'b1_001_0110; // invalid crc
    
    
    

end 
  
reg [54:0]serializer_out;
reg [1:0]test_state;
reg [8:0]bit_ctr;
reg [2:0]errors;
// initialize 
initial 
begin 
     errors = 0; 
     serializer_out = 0;
     test_state = 0;
     bit_ctr = 0;
     pclk = 1;
     clock = 1; 
     reset = 1;
     #CLOCK_PERIOD reset = 0;
end 
   
   // clock generation  
always 
    #(CLOCK_PERIOD/2)  clock =  ! clock; 
    
always 
     #(PCLK_PERIOD/2)  pclk =  ! pclk; 

// test variables
integer RUN_TESTS;
integer UNEXPECTED_ERRORS;
integer EXPECTED_ERRORS;
integer CORRECT_FLAGS;
integer WRONG_FLAGS;
integer CORRECT_RESULTS;
integer WRONG_RESULTS;


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
             errors = 0;
            if(bit_ctr < 53) test_state = TEST_PROCESSING;
            else test_state = TEST_IDLE;
        end
        endcase
        
    end




initial begin 

    serial_data = 1;
    
    // test case 1
    // valid frames
      #(10*CLOCK_PERIOD);     
    //TEST 1      
      ctl_attach(serial_template_A[0], serial_template_B[0], 3'b000, ctl_template[0]);
      send_calculation_data( {serial_template_A[0], serial_template_B[0], ctl_template[0]} ); 
      #(100*PCLK_PERIOD);     
      compare( 3'b000, serial_template_A[0], serial_template_B[0], {serializer_out[52: 45], serializer_out[41: 34], serializer_out[30: 23], serializer_out[19: 12]}, serializer_out[7:4], errors );
    
   // TEST 2        
    
      ctl_attach(serial_template_A[1], serial_template_B[1], 3'b101, ctl_template[1]);
      send_calculation_data( {serial_template_A[1], serial_template_B[1], ctl_template[1]} ); 
      #(100*PCLK_PERIOD);     
      compare( 3'b101, serial_template_A[1], serial_template_B[1], {serializer_out[52: 45], serializer_out[41: 34], serializer_out[30: 23], serializer_out[19: 12]}, serializer_out[7:4], errors );          
     
    // TEST 3        
            
      ctl_attach(serial_template_A[2], serial_template_B[2], 3'b001, ctl_template[2]);
      send_calculation_data( {serial_template_A[2], serial_template_B[2], ctl_template[2]} ); 
      #(100*PCLK_PERIOD);     
      compare( 3'b001, serial_template_A[2], serial_template_B[2], {serializer_out[52: 45], serializer_out[41: 34], serializer_out[30: 23], serializer_out[19: 12]}, serializer_out[7:4], errors );   

    
    // TEST 4        
            
      send_calculation_data( {serial_template_4[0], serial_template_4[1], serial_template_4[2], serial_template_4[3], serial_template_4[4], serial_template_4[5], serial_template_4[6], serial_template_4[7], serial_template_4[8]} );     
     #(100*PCLK_PERIOD);  
     compare_error(errors, 3'b001);
        
        
    // TEST 5        
                
      send_calculation_data( {serial_template_5[0], serial_template_5[1], serial_template_5[2], serial_template_5[3], serial_template_5[4], serial_template_5[5], serial_template_5[6], serial_template_5[7], serial_template_5[8]} ); 
     #(100*PCLK_PERIOD);  
      compare_error(errors, 3'b001); 
            
                      
    // TEST 6        
                    
      send_calculation_data( {serial_template_6[0], serial_template_6[1], serial_template_6[2], serial_template_6[3], serial_template_6[4], serial_template_6[5], serial_template_6[6], serial_template_6[7], serial_template_6[8]} ); 
     #(100*PCLK_PERIOD);  
      compare_error(errors, 3'b001);
 
    // TEST 7        
      send_calculation_data( {serial_template_7[0], serial_template_7[1], serial_template_7[2], serial_template_7[3], serial_template_7[4], serial_template_7[5], serial_template_7[6], serial_template_7[7], serial_template_7[8]} ); 
     #(100*PCLK_PERIOD);  
     compare_error(errors, 3'b001);

    // TEST 8        
            
   send_calculation_data( {serial_template_8[0], serial_template_8[1], serial_template_8[2], serial_template_8[3], serial_template_8[4], serial_template_8[5], serial_template_8[6], serial_template_8[7], serial_template_8[8]} ); 
     #(100*PCLK_PERIOD);  
   compare_error(errors, 3'b001);  
        
        
    // TEST 9        
                
      send_calculation_data( {serial_template_9[0], serial_template_9[1], serial_template_9[2], serial_template_9[3], serial_template_9[4], serial_template_9[5], serial_template_9[6], serial_template_9[7], serial_template_9[8]} ); 
     #(100*PCLK_PERIOD);  
     compare_error(errors, 3'b100);
            
                                      
    $finish;
end
  
  // tasks definistion
  
  task send_byte;  
      input [7:0] byte;
      input cmd;
      begin
        serial_data = 1'b0; // start_bit
        #BIT_SAMPLING_CYCLES;         
        if( cmd == 1 ) serial_data = 1'b1; // packet type bit
        else serial_data = 1'b0;
        #BIT_SAMPLING_CYCLES; // data or cmd 
        for( i = BYTE_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = byte[i];
            #BIT_SAMPLING_CYCLES;                               
        end  
        serial_data = 1'b1;  
        #BIT_SAMPLING_CYCLES;
      end
  endtask 
  
  // task send_calculation_data 
  
  task send_calculation_data;
      input[71:0] data;
      reg [BYTE_SIZE:0] packages[FRAME_NUMBER : 0] ;
      begin
          
          packages[0]= data[71:64];
          packages[1] =data[63:56];
          packages[2] =data[55:48];
          packages[3] =data[47:40];
          packages[4] =data[39:32];
          packages[5] =data[31:24];
          packages[6] =data[23:16];
          packages[7] =data[15:8];
          packages[8] =data[7:0];
          #CLOCK_PERIOD;
          for( j = 0 ; j <= 7; j = j+1) begin
            #CLOCK_PERIOD;
            send_byte(packages[j],0);  
          end     
            #CLOCK_PERIOD;
            send_byte(packages[8],1);  
      
      end
  endtask
  
  task compare;
    input [2:0] OPERATION;
    input [31:0]A;
    input [31:0]B;
    input [31:0]RESULT;
    input [3:0] FLAGS;
    input [2:0] ERRORS;
    reg [31:0] expected_result;
    reg [3:0] expected_flags;
	reg carry;
  begin
      
      if(ERRORS == 0) begin
        expected_result = 0;
        expected_flags = 0;
        case(OPERATION)
            3'b000:
            begin
                expected_result = A&B; 
				#CLOCK_PERIOD;
				if(expected_result == 0) expected_flags[2] = 1;
				#CLOCK_PERIOD;
				if(expected_result[31] == 1) expected_flags[3] = 1;
            end 
            3'b001:
            begin
                expected_result = A|B;
				#CLOCK_PERIOD;
				if(expected_result == 0) expected_flags[2] = 1;
				#CLOCK_PERIOD;
				if(expected_result[31] == 1) expected_flags[3] = 1;
            end
            3'b100:
            begin 
                {carry, expected_result} = A+B;
				#CLOCK_PERIOD;
				if(expected_result == 0) expected_flags[2] = 1;
				#CLOCK_PERIOD;
				if(expected_result[31] == 1) expected_flags[3] = 1;
				#CLOCK_PERIOD;
				if(carry == 1) expected_flags[1] = 1;
				#CLOCK_PERIOD;
				if(!A[31]&!B[31]&expected_result[31]) expected_flags[0] = 1;
            end
            3'b101:
            begin
                expected_result = A-B;
				#CLOCK_PERIOD;
				if(expected_result == 0) expected_flags[2] = 1;
				#CLOCK_PERIOD;
				if(expected_result[31] == 1) expected_flags[3] = 1;
				#CLOCK_PERIOD;
				if(B>A) expected_flags[1] = 1;
				#CLOCK_PERIOD;
				if(A[31]&!B[31]&!expected_result[31]) expected_flags[0] = 1;
				
            end
            endcase 
            #CLOCK_PERIOD;
            if( RESULT == expected_result)begin
                $display("RESULT OK");
                CORRECT_RESULTS = CORRECT_RESULTS+1;
            end
            else 
            begin
                $display("RESULT NOT OK");
                WRONG_RESULTS = WRONG_RESULTS+1;
            end
			
			#CLOCK_PERIOD;
            if( FLAGS == expected_flags)begin
                $display("FLAGS OK");
                CORRECT_FLAGS = CORRECT_FLAGS+1;
            end
            else 
            begin
                $display("FLAGS NOT OK, EXPECTED %b ACTUAL, %b", expected_flags, FLAGS);
                CORRECT_FLAGS = WRONG_FLAGS+1;
            end
            
            
       end
       else begin
            $display("UNEXPECTED_ERROR_DETECTED"); 
            UNEXPECTED_ERRORS = UNEXPECTED_ERRORS+1;
           
            reset = 1;
            #CLOCK_PERIOD;
            reset = 0;
       end
  
  end
  endtask
  
  task compare_error;
    input [2:0]ERRORS;
    input [2:0]EXPECTED_ERROR;
  begin
        if(ERRORS == 0)begin
            $display("NO ERRORS TEST_FAILED - ERROR EXPECTED");
        end
        else
        begin
            if(EXPECTED_ERROR == ERRORS) begin
                $display("OK - EXPECTED_ERROR_DETECTED"); 
                EXPECTED_ERRORS = EXPECTED_ERRORS+1;                
            end
            else 
            begin
                $display("UNEXPECTED_ERROR_DETECTED"); 
                UNEXPECTED_ERRORS = UNEXPECTED_ERRORS+1;
            end 
        
        end 
        reset = 1;
        #PCLK_PERIOD;
        reset = 0;
  end
  endtask
 
 
 task ctl_attach;
 input [31:0] data_A;
 input [31:0] data_B;
 input [2:0] command;
 output [7:0] ctl;
 begin
    ctl[7] = 1'b1;
    ctl[6:4] = command;
    ctl[3:0] = nextCRC4_D68({data_A, data_B,1'b1, command}, 4'b0000);
    #CLOCK_PERIOD;
 end
 endtask
 
   function [3:0] nextCRC4_D68;
     // polynomial: x^4 + x^1 + 1
     // data width: 68
     // convention: the first serial bit is D[67]
     
       input [67:0] Data;
       input [3:0] crc;
       reg [67:0] d;
       reg [3:0] c;
       reg [3:0] newcrc;
     begin
       d = Data;
       c = crc;
     
       newcrc[0] = d[66] ^ d[64] ^ d[63] ^ d[60] ^ d[56] ^ d[55] ^ d[54] ^ d[53] ^ d[51] ^ d[49] ^ d[48] ^ d[45] ^ d[41] ^ d[40] ^ d[39] ^ d[38] ^ d[36] ^ d[34] ^ d[33] ^ d[30] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[18] ^ d[15] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[0] ^ c[2];
       newcrc[1] = d[67] ^ d[66] ^ d[65] ^ d[63] ^ d[61] ^ d[60] ^ d[57] ^ d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[48] ^ d[46] ^ d[45] ^ d[42] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[33] ^ d[31] ^ d[30] ^ d[27] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^ d[12] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[2] ^ c[3];
       newcrc[2] = d[67] ^ d[66] ^ d[64] ^ d[62] ^ d[61] ^ d[58] ^ d[54] ^ d[53] ^ d[52] ^ d[51] ^ d[49] ^ d[47] ^ d[46] ^ d[43] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[34] ^ d[32] ^ d[31] ^ d[28] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[16] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[2] ^ d[1] ^ c[0] ^ c[2] ^ c[3];
       newcrc[3] = d[67] ^ d[65] ^ d[63] ^ d[62] ^ d[59] ^ d[55] ^ d[54] ^ d[53] ^ d[52] ^ d[50] ^ d[48] ^ d[47] ^ d[44] ^ d[40] ^ d[39] ^ d[38] ^ d[37] ^ d[35] ^ d[33] ^ d[32] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[17] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ c[1] ^ c[3];
       nextCRC4_D68 = newcrc;
     end
     endfunction
  
  
endmodule
