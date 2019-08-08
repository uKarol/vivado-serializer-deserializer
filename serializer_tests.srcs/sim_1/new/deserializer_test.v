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
    wire [7:0] data_out;
    wire ack_test;
    wire stop_bit_error; 
    
    wire [7:0] temp_data;
    wire [5:0] temp_state;
    wire [3:0] bit_ctr;
    wire [3:0] ovs_ctr;
    
    deserializer_core_32 DUT(    
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out_A( data_out ),
        .ack(ack_test),
        .frame_error(stop_bit_error),
        
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
    
    
    reg [FRAME_SIZE:0] serial_template_1 = 11'b0_0_1010_1010_1; // valid frame
    reg [FRAME_SIZE:0] serial_template_2 = 11'b0_0_1111_0000_1; // valid frame
    reg [FRAME_SIZE:0] serial_template_3 = 11'b0_0_1100_1100_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_4 = 11'b0_0_0011_0101_1; // valid frame 
    reg [FRAME_SIZE:0] serial_template_5 = 11'b0_0_1001_0101_1; // valid frame 
    
    
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
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                       
        end           
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_1[8:1] ) $display("TEST 1 PASSED");
        else $display("TEST 1 FAILED");
        
        // test case 2
        // frame with invalid stop bit, frame error expected  
        
        #CLOCK_PERIOD $display("TEST 2, serial data in: %b", serial_template_2[8:1]);
        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_2[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                       
        end           
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_2[8:1] ) $display("TEST 2 PASSED");
        else $display("TEST 2 FAILED");
        
        // test case 3
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 3, serial data in: %b", serial_template_3[8:1]);
        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_3[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_3[8:1] ) $display("TEST 3 PASSED");
        else $display("TEST 3 FAILED");
        
        // test case 4
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 4, serial data in: %b", serial_template_3[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_4[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_4[8:1] ) $display("TEST 4 PASSED");
        else $display("TEST 4 FAILED");

        
        
        // test case 5
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 5, serial data in: %b", serial_template_5[8:1]);

        for(  i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
            serial_data = serial_template_5[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_5[8:1] ) $display("TEST 5 PASSED");
        else $display("TEST 5 FAILED");

 
        $finish;
    end
    
    
    
endmodule
