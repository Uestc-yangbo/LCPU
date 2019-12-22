`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 21:20:50
// Design Name: 
// Module Name: ADDSUB_32
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


module ADDSUB_32(X,Y,Sub,S);
    input [31:0]X,Y;
    wire Cout;
    input Sub;
    output [31:0]S;
    CLA_32 adder0(X,Y^{32{Sub}},Sub,S,Cout);
endmodule
