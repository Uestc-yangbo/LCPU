`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 09:14:07
// Design Name: 
// Module Name: REG_ifid
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

module REG_IFID(D0,D1,En,Clk,Clrn,Q0,Q1,STALL,Condep);
    input [31:0]D0,D1;
    input En,Clk,Clrn;
    input STALL,Condep;
    output [31:0]Q0,Q1;
    wire En_S,Clrn_C;
    wire [31:0]Q0n,Q1n;
    assign En_S=En&~STALL;//如果需要暂停，则关闭写使能端
    assign Clrn_C=Clrn&~Condep;//如果产生控制冒险，则需要清零寄存器
    D_FFEC32 q0(D0,Clk,En_S,Clrn_C,Q0,Q0n);//PC字段寄存器,32位
    D_FFEC32 q1(D1,Clk,En_S,Clrn_C,Q1,Q1n);//IR字段寄存器，32位
endmodule
