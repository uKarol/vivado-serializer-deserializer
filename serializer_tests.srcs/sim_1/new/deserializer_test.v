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
    
    deserializer_core DUT(
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out( data_out ),
        .des_state(state)
    );
    
    initial
     begin 
         clock = 0; 
         reset = 1;
         #1 reset = 0;
       end 
         
       always 
          #5  clock =  ! clock; 

    
    initial begin 
        serial_data = 0;
        #160 serial_data = 1; // start
        #160 serial_data = 0; // bit 1
        #160 serial_data = 1; // 2
        #160 serial_data = 0; // 3
        #160 serial_data = 1; // 4
        #160 serial_data = 0; // 5
        #160 serial_data = 1; // 6
        #160 serial_data = 0; // 7
        #160 serial_data = 1; // 8
        #160 serial_data = 0; // stop
    end
    
    
    
endmodule
