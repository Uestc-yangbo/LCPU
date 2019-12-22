`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 20:22:14
// Design Name: 
// Module Name: REG_MEMWB
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


module REG_MEMWB(D6,D5,D0,D1,D2,D3,D4,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4,Q5,Q6);
    input D0,D1,D6;
    input [31:0] D2,D3,D5;
    input [4:0] D4;
    input En,Clk,Clrn;
    output Q0,Q1,Q6;
    output [31:0] Q2,Q3,Q5;
    output [4:0] Q4;
    wire Qn0,Qn1,Qn6;
    wire [31:0] Qn2,Qn3,Qn5;
    wire [4:0] Qn4;
    D_FFEC q0(D0,Clk,En,Clrn,Q0,Qn0);//Wreg×Ö¶Î£¬1Î»
    D_FFEC q1(D1,Clk,En,Clrn,Q1,Qn1);//Reg2reg×Ö¶Î£¬1Î»
    D_FFEC32 q2(D2,Clk,En,Clrn,Q2,Qn2);//R×Ö¶Î£¬32Î»
    D_FFEC32 q3(D3,Clk,En,Clrn,Q3,Qn3);//Dout×Ö¶Î£¬32Î»
    D_FFEC5 q4(D4,Clk,En,Clrn,Q4,Qn4);//Rd×Ö¶Î£¬5Î»
    D_FFEC32 q5(D5,Clk,En,Clrn,Q5,Qn5);//PCadd4×Ö¶Î£¬32Î»
    D_FFEC q6(D6,Clk,En,Clrn,Q6,Qn6);//jal×Ö¶Î£¬1Î»
endmodule
