`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 17:45:47
// Design Name: 
// Module Name: D_Latch
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


module D_Latch(D,En,Q,Qn);
    input D,En;
    output Q,Qn;
    wire Sn,Rn,Dn;
    not i0(Dn,D);
    nand i1(Sn,D,En);
    nand i2(Rn,En,Dn);
    nand i3(Q,Sn,Qn);
    nand i4(Qn,Q,Rn);
endmodule
