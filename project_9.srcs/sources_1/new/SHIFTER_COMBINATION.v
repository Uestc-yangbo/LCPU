`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 14:21:22
// Design Name: 
// Module Name: SHIFTER_COMBINATION
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

module SHIFTER_COMBINATION(X,PCADD4,Sh);
    input [25:0] X;
    input [31:0] PCADD4;
    output [31:0] Sh;
    parameter z=2'b00;
    assign Sh={PCADD4[31:28],X[25:0],z};
endmodule
