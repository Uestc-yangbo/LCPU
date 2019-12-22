`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 19:54:47
// Design Name: 
// Module Name: D_FFEC4
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

module D_FFEC4(D,Clk,En,Clrn,Q,Qn);
    input[3:0]D;
    input Clk,En,Clrn;
    output[3:0]Q,Qn;
    D_FFEC d0(D[0],Clk,En,Clrn,Q[0],Qn[0]);
    D_FFEC d1(D[1],Clk,En,Clrn,Q[1],Qn[1]);
    D_FFEC d2(D[2],Clk,En,Clrn,Q[2],Qn[2]);
    D_FFEC d3(D[3],Clk,En,Clrn,Q[3],Qn[3]);
endmodule
