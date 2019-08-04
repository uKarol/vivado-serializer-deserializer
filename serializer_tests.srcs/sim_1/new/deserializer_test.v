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
    wire [31:0] data_out;
    wire ack_test;
    reg req_test;
    wire stop_bit_error; 
    
    deserializer_core_32 DUT(
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out( data_out ),
        .ack(ack_test),
        .req(req_test),
        .frame_error(stop_bit_error) 
    );
    
    localparam 
        CLOCK_PERIOD = 10,
        OVERSAMPLING_SAMPLES = 16,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES; 
     
    
    
    integer i; // loop counter
    
    reg [33:0] serial_template_1 = 34'b0_1010_1010_1010_1010_1010_1010_1010_1010_1; // valid frame
    reg [33:0] serial_template_2 = 34'b1_1100_1100_1100_1100_1100_1100_1100_1100_1; // frame with invalid stop bit
    reg [33:0] serial_template_3 = 34'b0_1111_0000_1111_0000_1111_0000_1111_0000_1; // valid frame 
    reg [33:0] serial_template_4 = 34'b0_1010_1001_1001_1111_1010_0011_1111_0000_1; // valid frame 
    reg [33:0] serial_template_5 = 34'b0_0110_0110_1111_1001_1111_0000_1111_0110_1; // valid frame 
    
    
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
   
        serial_data = 0;
        
        // test case 1
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 1, serial data in: %b", serial_template_1[32:1]);
        req_test = 1;
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_1[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                       
        end           
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_1[32:1] ) $display("TEST 1 PASSED");
        else $display("TEST 1 FAILED");
        req_test = 0; 
        
        // test case 2
        // frame with invalid stop bit, frame error expected  
        
        #CLOCK_PERIOD $display("TEST 2, serial data in: %b", serial_template_2[32:1]);
        req_test = 1;
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_2[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                     
        end
          
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);       
        if( stop_bit_error == 1 ) $display("TEST 2 PASSED");
        else $display("TEST 2 FAILED");
        req_test = 0;
        reset = 1;
        #CLOCK_PERIOD reset = 0;
        
        // test case 3
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 3, serial data in: %b", serial_template_3[32:1]);
        req_test = 1;
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_3[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_3[32:1] ) $display("TEST 3 PASSED");
        else $display("TEST 3 FAILED");
        req_test = 0; 
        
        // test case 4
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 4, serial data in: %b", serial_template_3[32:1]);
        req_test = 1;
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_4[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_4[32:1] ) $display("TEST 4 PASSED");
        else $display("TEST 4 FAILED");
        req_test = 0; 
        
        
        // test case 5
        // valid frame
        
        #CLOCK_PERIOD $display("TEST 5, serial data in: %b", serial_template_5[32:1]);
        req_test = 1;
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_5[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_5[32:1] ) $display("TEST 5 PASSED");
        else $display("TEST 5 FAILED");
        req_test = 0; 
 
        $finish;
    end
    
    
    
endmodule
