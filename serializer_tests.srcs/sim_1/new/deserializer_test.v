`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2019 11:18:21
// Design Name: 
// Module Name: deserializer_test
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


module deserializer_test(

    );
    
    reg clock, serial_data, reset; 
    wire [31:0] data_out;
    
    deserializer_core_32 DUT(
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out( data_out )
    );
    
    localparam 
        CLOCK_PERIOD = 10,
        OVERSAMPLING_SAMPLES = 16,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES; 
     
    
    
    integer i; // loop counter
    
    reg [33:0] serial_template_1 = 34'b0_1010_1010_1010_1010_1010_1010_1010_1010_1;
    reg [33:0] serial_template_2 = 34'b0_1100_1100_1100_1100_1100_1100_1100_1100_1; 
    reg [33:0] serial_template_3 = 34'b0_1111_0000_1111_0000_1111_0000_1111_0000_1;
    
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
        #CLOCK_PERIOD $display("TEST 1, serial data in: %b", serial_template_1[32:1]);
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_1[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                       
        end           
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_1[32:1] ) $display("TEST 1 PASSED");
        else $display("TEST 1 FAILED");
        
        // test case 2
        
        $display("TEST 2, serial data in: %b", serial_template_2[32:1]);
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_2[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);                     
        end
             
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);       
        if( data_out == serial_template_2[32:1] ) $display("TEST 2 PASSED");
        else $display("TEST 2 FAILED");
               
        // test case 3
        
        $display("TEST 3, serial data in: %b", serial_template_3[32:1]);
        for( i = 0; i<34; i=i+1) begin
            serial_data = serial_template_3[i];
            #BIT_SAMPLING_CYCLES $display("data_in %b", serial_data);               
        end
               
        #(2*BIT_SAMPLING_CYCLES) $display("paralel data %b", data_out);        
        if( data_out == serial_template_3[32:1] ) $display("TEST 3 PASSED");
        else $display("TEST 3 FAILED");
        
 
        $finish;
    end
    
    
    
endmodule
