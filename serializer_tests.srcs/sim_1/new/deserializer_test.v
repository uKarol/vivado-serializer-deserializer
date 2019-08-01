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
    wire [7:0] data_out;
    wire [1:0] state;
    wire [3:0] bit_counter;
    wire [3:0] ovs_counter;
    
    deserializer_core DUT(
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out( data_out ),
        .des_state(state),
        .oversample_counter(ovs_counter),
        .bit_counter(bit_counter)
    );
    
    integer i; // loop counter
    
    reg [9:0] serial_template_1 = 9'b0101010101;
    reg [9:0] serial_template_2 = 9'b0110011001; 
    reg [9:0] serial_template_3 = 9'b0111100001;
    
    initial 
    begin 
         clock = 1; 
         reset = 1;
         #1 reset = 0;
    end 
       
       // clock generation  
    always 
        #5  clock =  ! clock; 

    
    initial begin 
   
        serial_data = 0;
        
        // test case 1
        #160 $display("TEST 1, serial data in: %b", serial_template_1[8:1]);
        for( i = 0; i<10; i=i+1) begin
            serial_data = serial_template_1[i];
            #160 $display("data_in");
            $display("data_in %b", serial_data);
            $display("bit counter %d", bit_counter);
            $display("paralel data %b", data_out);
            $display("state %b", state);
                        
        end
        
        
        #320 $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        
        if( data_out == serial_template_1[8:1] ) $display("TEST 1 PASSED");
        else $display("TEST 1 FAILED");
        
        // test case 2
        
        #160 $display("TEST 2, serial data in: %b", serial_template_2[8:1]);
        for( i = 0; i<10; i=i+1) begin
            serial_data = serial_template_2[i];
            #160 $display("data_in");
            $display("data_in %b", serial_data);
            $display("bit counter %d", bit_counter);
            $display("paralel data %b", data_out);
            $display("state %b", state);
                        
        end
        
        
        #320 $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        
        if( data_out == serial_template_2[8:1] ) $display("TEST 2 PASSED");
        else $display("TEST 2 FAILED");
        
        
        // test case 3
        
        #160 $display("TEST 2, serial data in: %b", serial_template_3[8:1]);
        for( i = 0; i<10; i=i+1) begin
            serial_data = serial_template_3[i];
            #160 $display("data_in");
            $display("data_in %b", serial_data);
            $display("bit counter %d", bit_counter);
            $display("paralel data %b", data_out);
            $display("state %b", state);
                        
        end
        
        
        #320 $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        
        if( data_out == serial_template_3[8:1] ) $display("TEST 3 PASSED");
        else $display("TEST 3 FAILED");
        
 
        $finish;
    end
    
    
    
endmodule
