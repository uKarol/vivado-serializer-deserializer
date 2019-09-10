`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Karol Ujda
// 
// Create Date: 06.09.2019 19:50:59
// Design Name: 
// Module Name: mtm_ALU
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


module mtm_Alu(
    input clk,
    input rst_n,
    input sin,
    output sout

    );
    
    wire [31:0]data_A;
    wire [31:0]data_B;
    wire [2:0]opcode;
    wire ack_des;
    wire ack_ser;
    wire data_error;
    wire crc_error;
    wire ack_alu;
    wire [31:0]result;
    wire op_err;
    wire [2:0]crc_out;
    wire [3:0]flags_out;
    
    
    mtm_Alu_deserializer u_mtm_Alu_deserializer(
        .clk(clk),
        .rst(rst_n),
        .serial_in(sin),
        .data_out_A(data_A),
        .data_out_B(data_B),
        .ack(ack_des),
        .frame_error(data_error),
        .crc_error(crc_error), 
        .opcode(opcode)
        
    );
    
    mtm_Alu_core u_mtm_Alu_core(
            .clk(clk),
            .rst(rst_n),
            .req(ack_des),
            .ack_in(!ack_ser),
            .ack(ack_alu), 
            .a(data_A),
            .b(data_B),
            .ALUControl(opcode),
            .Result(result),
            .OP_Err(op_err),
            .ALUFlags(flags_out),
            .crc_out(crc_out)
            );
    
    
   mtm_Alu_serializer u_mtm_Alu_serializer(
        .clk(clk),
        .rst(rst_n),
        .req(ack_alu),
        .data_in(result),
        .crc_in(crc_out),
        .alu_flags_in(flags_out),
        .data_err_in(data_error),
        .crc_err_in(crc_error),
        .op_err_in(op_err),
        .serial_out(sout),
        .ack(ack_ser)
    );
    
    
endmodule
