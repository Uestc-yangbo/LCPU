`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 15:59:42
// Design Name: 
// Module Name: MUX32X32
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


module MUX32X32(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,
A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,S,Y);
input [31:0]A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,
A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31;
input [4:0]S;
output [31:0]Y;
function [31:0]select;
input [31:0]A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,
A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31;
input [4:0]S;
case(S)
5'b00000:select=A0;
5'b00001:select=A1;
5'b00010:select=A2;
5'b00011:select=A3;
5'b00100:select=A4;
5'b00101:select=A5;
5'b00110:select=A6;
5'b00111:select=A7;
5'b01000:select=A8;
5'b01001:select=A9;
5'b01010:select=A10;
5'b01011:select=A11;
5'b01100:select=A12;
5'b01101:select=A13;
5'b01110:select=A14;
5'b01111:select=A15;
5'b10000:select=A16;
5'b10001:select=A17;
5'b10010:select=A18;
5'b10011:select=A19;
5'b10100:select=A20;
5'b10101:select=A21;
5'b10110:select=A22;
5'b10111:select=A23;
5'b11000:select=A24;
5'b11001:select=A25;
5'b11010:select=A26;
5'b11011:select=A27;
5'b11100:select=A28;
5'b11101:select=A29;
5'b11110:select=A30;
5'b11111:select=A31;
endcase
endfunction
assign Y=select(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,
A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,S);
endmodule