`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Agnieszka Windak
// 
// Create Date: 01.09.2019 21:40:33
// Design Name: 
// Module Name: alu_core
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


module  mtm_Alu_core(
        input wire clk,
        input wire rst,
        input wire req,
        input wire ack_in,
        output reg ack, 
        input  wire [31:0] a,
        input  wire [31:0] b,
        input  wire [2:0]  ALUControl,
        output reg  [31:0] Result,
        output reg         OP_Err,
        output reg [3:0]  ALUFlags,
        output reg [2:0]crc_out,
        output reg des_ack
        );
        
        localparam 
            IDLE = 3'b000,
            PROCESSING = 3'b001,
            CRC = 3'b010,
            FINISH = 3'b011,
            OP_ERR = 3'b101;
            
      reg [2:0]alu_state;
      reg [2:0]alu_state_nxt;
      reg  [31:0] Result_nxt;
      reg         OP_Err_nxt;
      reg [3:0]  ALUFlags_nxt;
      wire [32:0]   sum_nxt;
      reg [2:0]crc_out_nxt;
      reg ack_nxt;
       reg des_ack_nxt;
    
        wire  neg, zero, carry, overflow;
        wire [31:0] condinvb;
        wire [32:0]   sum;
    
        assign condinvb = ALUControl[0] ? ~b : b;
        assign sum      = {1'b0,a} + ({1'b0,condinvb} + {30'b0,ALUControl[0]});
        
        
        always @(posedge clk) begin
            if(rst==0) begin    
                alu_state <= IDLE;
                Result <= 0;
                ALUFlags <= 4'b0;
                OP_Err <= 1'b0;  
                ack <= 1'b0;           
                crc_out <= 3'b0;      
                des_ack <= 1'b0;
            end
            else begin
                alu_state <= alu_state_nxt;
                Result <= Result_nxt;
                ALUFlags <= ALUFlags_nxt;
                OP_Err <= OP_Err_nxt; 
                ack <= ack_nxt;    
                crc_out <= crc_out_nxt;    
                des_ack <= des_ack_nxt; 
            end
        end
    
        always @*
        
            case(alu_state) 
            
            IDLE:
            begin
                crc_out_nxt = crc_out; 
                Result_nxt = Result;
                OP_Err_nxt = OP_Err;
                ALUFlags_nxt = ALUFlags;
                des_ack_nxt <= 1'b0;
                ack_nxt = 1'b0;
                if(req == 1) alu_state_nxt = PROCESSING;               
                else alu_state_nxt = IDLE;
                
            end
                     
            PROCESSING:
            begin
                des_ack_nxt <= 1'b1;
                ALUFlags_nxt ={neg, zero, carry, overflow};
                ack_nxt = 1'b0;    
                crc_out_nxt = crc_out; 
                casex (ALUControl[2:0])
                    3'b000: begin
                                Result_nxt = a & b;   
                                OP_Err_nxt = 1'b0;        
                                alu_state_nxt = CRC; 
                            end
                    3'b001: begin
                                Result_nxt = a | b;
                                OP_Err_nxt = 1'b0;
                                alu_state_nxt = CRC;
                            end
                    3'b10?: begin
                                Result_nxt = sum[31:0];
                                OP_Err_nxt = 1'b0;
                                alu_state_nxt = CRC;
                            end
                    default: begin 
                            Result_nxt = 0;
                            OP_Err_nxt = 1'b1;
                            alu_state_nxt = OP_ERR;
                        end
                endcase
              end
              
              CRC: 
              begin
                des_ack_nxt <= 1'b1;
                ALUFlags_nxt = ALUFlags;
                crc_out_nxt = nextCRC3_D37({Result, 1'b1, ALUFlags}, 3'b000); 
                Result_nxt = Result;
                OP_Err_nxt = OP_Err;
                ack_nxt = 1'b0;
                alu_state_nxt = FINISH;               
              end
              
              FINISH: 
              begin
                des_ack_nxt <= 1'b1;
                ALUFlags_nxt = ALUFlags;
                crc_out_nxt = crc_out; 
                Result_nxt = Result;
                OP_Err_nxt = OP_Err;
                ack_nxt = 1'b1;
                if(ack_in==1)alu_state_nxt = IDLE;   
                else alu_state_nxt = FINISH;             
              end
              
              OP_ERR: 
              begin
                des_ack_nxt <= 1'b0;
                ALUFlags_nxt = ALUFlags;
                crc_out_nxt = crc_out; 
                Result_nxt = Result;
                OP_Err_nxt = OP_Err;
                ack_nxt = 1'b0;
                alu_state_nxt = IDLE;              
              end
              
              default: 
              begin
               des_ack_nxt <= 1'b0;
                  crc_out_nxt = crc_out; 
                  Result_nxt = Result;
                  OP_Err_nxt = OP_Err;
                  ALUFlags_nxt = ALUFlags;
                  ack_nxt = 1'b0;
                  alu_state_nxt = IDLE;
                  
              end
              
        endcase
    
    assign neg      = Result_nxt[31];
    assign zero     = (Result_nxt == {32{1'b0}});
    assign carry    = ( sum[32]&&((ALUControl == 3'b100))||(((ALUControl == 3'b101) && (b>a))) );
    assign overflow = sum[31]&&((ALUControl == 3'b100)&(!a[31]&!b[31]) )||!sum[31]&&(((ALUControl == 3'b101) & (a[31]&!b[31])));

    
  
    
      // polynomial: x^3 + x^1 + 1
      // data width: 37
      // convention: the first serial bit is D[36]
      function [2:0] nextCRC3_D37;
    
        input [36:0] Data;
        input [2:0] crc;
        reg [36:0] d;
        reg [2:0] c;
        reg [2:0] newcrc;
      begin
        d = Data;
        c = crc;
    
        newcrc[0] = d[35] ^ d[32] ^ d[31] ^ d[30] ^ d[28] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[11] ^ d[10] ^ d[9] ^ d[7] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[1];
        newcrc[1] = d[36] ^ d[35] ^ d[33] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[23] ^ d[22] ^ d[21] ^ d[19] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[2] ^ d[1] ^ d[0] ^ c[1] ^ c[2];
        newcrc[2] = d[36] ^ d[34] ^ d[31] ^ d[30] ^ d[29] ^ d[27] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[10] ^ d[9] ^ d[8] ^ d[6] ^ d[3] ^ d[2] ^ d[1] ^ c[0] ^ c[2];
        nextCRC3_D37 = newcrc;
      end
      endfunction

    
    endmodule

    
    
    
    
    
    
    
    
    
    
    
  