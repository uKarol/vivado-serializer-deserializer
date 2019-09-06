`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 19:48:38
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    input rst,
    output reg clk_out
    );
    
    reg clk_out_nxt;
    reg [3:0]ctr;
    reg [3:0]ctr_nxt;
    
    always @(posedge clk) begin 
    
        if(rst == 1) begin
            clk_out <= 0;
            ctr <= 0;
        end
        else begin
            clk_out <= clk_out_nxt;
            ctr <= ctr_nxt;          
        end
        
    end 
    
    always @*
    begin
        if( ctr == 4'b1111 )begin
            ctr_nxt = 0;
            clk_out_nxt = ~clk_out;
        end
        else begin
            ctr_nxt = ctr + 1;
            clk_out_nxt = clk_out;
        end
    
    end
    
endmodule
