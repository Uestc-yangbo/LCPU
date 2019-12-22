`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 15:21:45
// Design Name: 
// Module Name: PC
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

module PC(IF_NEXTADDR,Clk,En,Clrn,IF_Addr,STALL);
    input [31:0]IF_NEXTADDR;
    input Clk,En,Clrn,STALL;
    output [31:0]IF_Addr;
    wire [31:0]IF_Addr_n;
    wire En_S;
    assign En_S=En&~STALL;//如果需要暂停，则关闭写使能端
    D_FFEC32 D_FFEC32_0(IF_NEXTADDR,Clk,En_S,Clrn,IF_Addr,IF_Addr_n);
endmodule 