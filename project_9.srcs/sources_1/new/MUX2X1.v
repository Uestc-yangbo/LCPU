`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 18:57:06
// Design Name: 
// Module Name: MUX2X1
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


module MUX2X1(A0,A1,S,Y);
    input A0,A1,S;
    output Y;
    not i0(S_n,S);
    nand i1(A0_S,A0,S_n);
    nand i2(A1_S,A1,S);
    nand i3(Y,A0_S,A1_S);
endmodule
