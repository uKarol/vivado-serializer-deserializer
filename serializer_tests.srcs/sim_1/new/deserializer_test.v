`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  AGH UST
// Engineer: Karol Ujda
// 
// Create Date: 01.08.2019 11:18:21
// Design Name: 
// Module Name: deserializer_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Test case 1: valid frame
// Test case 2: frame with invalid stop bit
// Test case 3: valid frame
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module deserializer_test(

    );
    
    reg clock, serial_data, reset; 
    wire [31:0] data_out_A;
    wire [31:0] data_out_B;
    wire ack_test;
    wire stop_bit_error; 
    
    wire [7:0] temp_data;
    wire [5:0] temp_state;
    wire [3:0] bit_ctr;
    wire [3:0] ovs_ctr;
    
    wire [2:0] opcode_test;
    wire [3:0] crc_test;
    
    deserializer_core_32 DUT(    
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out_A( data_out_A ),
        .data_out_B(data_out_B),
        .ack(ack_test),
        .frame_error(stop_bit_error),
        
        .opcode(opcode_test),
        .crc(crc_test),
        
        .parallel_data_A(temp_data),
        .oversample_counter(ovs_ctr),
        .des_state(temp_state),
        .bit_counter(bit_ctr)

    );
    
    localparam 
        CLOCK_PERIOD = 10,
        OVERSAMPLING_SAMPLES = 16,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES,        
        FRAME_SIZE = 10;
    
    
    
    integer i; // loop counter
    
    // serial frame format: [ 0, packet type, packet pits, stop ] 
    
    // DATA FRAMES 
    reg [FRAME_SIZE:0] serial_template_1  = 11'b0_0_1010_1010_1; // valid frame
    reg [FRAME_SIZE:0] serial_template_2  = 11'b0_0_1111_0000_1; // valid frame
    reg [FRAME_SIZE:0] serial_template_3  = 11'b0_0_1100_1100_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_4  = 11'b0_0_0011_0101_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_5  = 11'b0_0_1001_0101_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_6  = 11'b0_0_0000_0101_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_7  = 11'b0_0_0001_0100_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_8  = 11'b0_0_0010_1111_1; // valid frame 
    
    
    // COMMAND FRAMES
    reg [FRAME_SIZE:0] cmd_serial_template_1  = 11'b0_1_1_000_1010_1; // valid frame
  
    
    
    initial 
    begin 
         clock = 1; 
         reset = 1;
         #1 reset = 0;
    end 
       
       // clock generation  
    always 
        #(CLOCK_PERIOD/2)  clock =  ! clock; 
   
    initial begin 
   
        serial_data = 1;
        
        // test case 1
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 1, serial data in: %b", serial_template_1[8:1]);
        for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_1[i];
            #BIT_SAMPLING_CYCLES;                       
        end           
        #(2*BIT_SAMPLING_CYCLES);         
        // test case 2
        // frame with invalid stop bit, frame error expected     
        #CLOCK_PERIOD $display("TEST 2, serial data in: %b", serial_template_2[8:1]);
        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_2[i];
            #BIT_SAMPLING_CYCLES;                       
        end           
        #(2*BIT_SAMPLING_CYCLES);      
        // test case 3
        // valid frame       
        #CLOCK_PERIOD $display("TEST 3, serial data in: %b", serial_template_3[8:1]);
        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_3[i];
            #BIT_SAMPLING_CYCLES;               
        end
               
        #(2*BIT_SAMPLING_CYCLES);        
        // test case 4
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 4, serial data in: %b", serial_template_4[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_4[i];
            #BIT_SAMPLING_CYCLES;               
        end
               
        #(2*BIT_SAMPLING_CYCLES);    
        
        // test case 5
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 5, serial data in: %b", serial_template_5[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_5[i];
            #BIT_SAMPLING_CYCLES;               
        end
               
        #(2*BIT_SAMPLING_CYCLES);
        
        // test case 6
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 6, serial data in: %b", serial_template_6[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_6[i];
            #BIT_SAMPLING_CYCLES;               
        end
               
        #(2*BIT_SAMPLING_CYCLES);
        
        // test case 7
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 7, serial data in: %b", serial_template_7[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_7[i];
            #BIT_SAMPLING_CYCLES;               
        end              
        #(2*BIT_SAMPLING_CYCLES);
        
        // test case 8
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 8, serial data in: %b", serial_template_8[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_8[i];
            #BIT_SAMPLING_CYCLES;               
        end
               
        #(2*BIT_SAMPLING_CYCLES);
             
        //cmd test case 1
        //cmd valid frame   
             
        #CLOCK_PERIOD $display("CMD TEST 1, OPCODE: %b , CRC: %b", cmd_serial_template_1[7:5], cmd_serial_template_1[4:1] );

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = cmd_serial_template_1[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("opcode %b, crc %b", opcode_test, crc_test);   
        if( data_out_A == 32'b1010_1010_1111_0000_1100_1100_0011_0101 )    $display("DATA A PASSED");  
        if( data_out_B == 32'b1001_0101_0000_0101_0001_0100_0010_1111 )    $display("DATA B PASSED");
        if(( opcode_test == cmd_serial_template_1[7:5] ) && ( crc_test == cmd_serial_template_1[4:1])) $display("CMD TEST 1 PASSED");
        else $display("CMD TEST 1 FAILED");
        
        
        $finish;
    end
    
    
    
endmodule
