`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2019 22:48:24
// Design Name: 
// Module Name: crc_test
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


module crc_test(

    );
   
   
    reg[67:0] data_in;
    wire[3:0] crc_out;
    reg clk;
    reg rst;
    reg en;
   
    
    crc_in_calculator DUT(
    .data_in(data_in),
    .crc_en(en),
    .crc_out(crc_out),
    .rst(rst),
    .clk(clk)
    );
    localparam 
    CLOCK_PERIOD = 5;
    initial 
    begin 
         clk = 1; 
         rst = 1;
         en = 0;
         #1 rst = 0;
    end 
       
       // clock generation  
    always 
        #(5)  clk =  ! clk; 
        
    initial
    begin
        en = 1;
        data_in = 68'b1010_1010_1010_1111;
        #(5*CLOCK_PERIOD);
        rst = 1;
        #(CLOCK_PERIOD);
        data_in = 68'b1011_1010_1010_1101;
        rst = 0;
        #(5*CLOCK_PERIOD);
        rst = 1 ;
        #(CLOCK_PERIOD);
        data_in = 68'b1011_1010_1010_1010;
        rst = 0;
        #(5*CLOCK_PERIOD);
        rst = 1 ;
        #(CLOCK_PERIOD);
        data_in = 68'b1011_1010_1011_1101;
        rst = 0;
        #(5*CLOCK_PERIOD);
        
        #100;
        $display("test finish");
        $finish;
    end
    
endmodule
