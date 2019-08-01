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
    
    initial
     begin 
         clock = 1; 
         reset = 1;
         #1 reset = 0;
       end 
         
       always 
          #5  clock =  ! clock; 

    
    initial begin 
        serial_data = 0;
        #160 serial_data = 1; // start
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 0; // bit 1
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 1; // 2
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 0; // 3
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 1; // 4
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 0; // 5
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 1; // 6
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 0; // 7
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 1; // 8
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #160 serial_data = 0; // stop
        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        #320        $display("data_in %b", serial_data);
        $display("bit counter %d", bit_counter);
        $display("paralel data %b", data_out);
        $display("state %b", state);
        $finish;
    end
    
    
    
endmodule
