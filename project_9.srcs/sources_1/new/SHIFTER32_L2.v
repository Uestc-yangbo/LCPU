`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 14:22:33
// Design Name: 
// Module Name: SHIFTER32_L2
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

module SHIFTER32_L2(X,Sh);
    input [31:0]X;
    output [31:0]Sh;
    SHIFTER SHIFTER_0(X,2,0,0,Sh);
endmodule
