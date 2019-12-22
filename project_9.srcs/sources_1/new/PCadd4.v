`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 14:05:37
// Design Name: 
// Module Name: PCadd4
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

module PCadd4(PC_0,PCadd4);
    input [31:0] PC_0;//原指令地址
    output [31:0] PCadd4;//+4后的新指令地址
    CLA_32 CLA_32_0(PC_0,4,0, PCadd4, Cout);
endmodule
