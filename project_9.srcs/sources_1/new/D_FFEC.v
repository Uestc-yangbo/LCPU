`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 17:39:10
// Design Name: 
// Module Name: D_FFEC
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


module D_FFEC(D,Clk,En,Clrn,Q,Qn);
    input D,Clk,En,Clrn;
    output Q,Qn;
    wire Y0,Y_C;
    MUX2X1 m0(Q,D,En,Y0);
    and i0(Y_C,Y0,Clrn);
    D_FF d0(Y_C,Clk,Q,Qn);
endmodule
