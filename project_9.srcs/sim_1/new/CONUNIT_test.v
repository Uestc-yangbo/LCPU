`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 17:16:29
// Design Name: 
// Module Name: CONUNIT_test
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


module CONUNIT_test;
    reg [5:0]Op,Func,E_Op;
    reg Z;
    reg E_Wreg,M_Wreg,E_Reg2reg;
    reg [4:0]E_Rd,M_Rd,Rs,Rt;
    wire Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,stall,condep;
    wire [1:0]Pcsrc;
    wire [3:0]Aluc;
    wire shift;
    wire j;
    wire [1:0]FwdA,FwdB;
    CONUNIT u(E_Op,Op,Func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,shift,j,Rs,Rt,E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,stall,condep);
    initial begin
        Op=6'b100011;
        Func=0;
        E_Op=6'b101011;
        Z=1;
        M_Wreg=1;
        E_Wreg=1;
        E_Reg2reg=0;
        E_Rd=1;
        Rs=1;
        M_Rd=2;
        Rt=2;
    end
    always #2 Rs=Rs+1;
    always #4 M_Rd=M_Rd+1;
endmodule
