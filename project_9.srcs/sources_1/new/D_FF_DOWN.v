`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/18 14:17:44
// Design Name: 
// Module Name: D_FF_DOWN
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


module D_FF_DOWN(D,Clk,Q,Qn);
input D,Clk;
output Q,Qn;
wire Clkn,Q0,Qn0;
not i0(Clkn,Clk);
D_Latch d0(D,Clk,Q0,Qn0);
D_Latch d1(Q0,Clkn,Q,Qn);
endmodule

