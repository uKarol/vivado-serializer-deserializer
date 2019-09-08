`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module mtm_ALU(
    input clk,
    input rst,
    input sin,
    output sout,
    // temporary
    output wire [31:0] result,
    output wire [2:0] crc_out,
    output wire [3:0] flags_out,
    output wire data_error,
    output wire crc_error,
    output wire op_err,
    output wire ack_alu
    
    );
    
    wire [31:0]data_A;
    wire [31:0]data_B;
    wire [2:0]opcode;
    wire ack_des;
    wire ack_ser;
    //wire data_error;
    //wire crc_error;
    
    deserializer_core_32 deserializer(
        .clk(clk),
        .rst(rst),
        .serial_in(sin),
        .data_out_A(data_A),
        .data_out_B(data_B),
        .ack(ack_des),
        .frame_error(data_error),
        .crc_error(crc_error), 
        .opcode(opcode)
        
    );
    
    alu_core alu_core(
            .clk(clk),
            .rst(rst),
            .req(ack_des),
            .ack_in(!ack_ser),
            .ack(ack_alu), 
            .a(data_A),
            .b(data_B),
            .ALUControl(opcode),
            .Result(result),
            .OP_Err(op_err),
            .ALUFlags(flags_out),
            .sum(),
            .crc_out(crc_out)
            );
    
    
    serializer_core serializer(
        .clk(clk),
        .rst(rst),
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
