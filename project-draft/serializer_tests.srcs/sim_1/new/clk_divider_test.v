`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 20:19:13
// Design Name: 
// Module Name: clk_divider_test
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


module clk_divider_test(

    );
    reg clock;
    reg reset;
    wire clk_out;
    
    localparam CLOCK_PERIOD = 10;
    
   clk_divider DUT(
        .clk(clock),
        .rst(reset),
        .clk_out(clk_out)
        );
    initial 
       begin 
         clock = 1; 
         reset = 1;
         #CLOCK_PERIOD reset = 0;
         
        # (100*CLOCK_PERIOD);
        $finish;
       end 
            
      // clock generation  
      always 
         #(CLOCK_PERIOD/2)  clock =  ! clock; 
    
endmodule
