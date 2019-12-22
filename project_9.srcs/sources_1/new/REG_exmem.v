`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 20:00:10
// Design Name: 
// Module Name: REG_EXMEM
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


module REG_EXMEM(D4,D3,D0,D1,D2,D6,D7,D8,En,Clk,Clrn,Q0,Q1,Q2,Q6,Q7,Q8,Q3,Q4);
    input [31:0]D3,D6,D7;
    input [4:0]D8;
    input D0,D1,D2,D4;
    
    input En,Clk,Clrn;
    output [31:0] Q3,Q6,Q7;
    output [4:0]Q8; 
    output Q0,Q1,Q2,Q4;
    
    wire [31:0] Qn3,Qn6,Qn7;
    wire [4:0]Qn8; 
    wire Qn0,Qn1,Qn2,Qn4;
    D_FFEC q0(D0,Clk,En,Clrn,Q0,Qn0);//Wreg×Ö¶Î£¬1Î»
    D_FFEC q1(D1,Clk,En,Clrn,Q1,Qn1);//Reg2reg×Ö¶Î£¬1Î»
    D_FFEC q2(D2,Clk,En,Clrn,Q2,Qn2);//Wmem×Ö¶Î£¬1Î»
    D_FFEC32 q3(D3,Clk,En,Clrn,Q3,Qn3);//PCadd4×Ö¶Î£¬32Î»
    D_FFEC q4(D4,Clk,En,Clrn,Q4,Qn4);//jal×Ö¶Î£¬1Î»
    D_FFEC32 q6(D6,Clk,En,Clrn,Q6,Qn6);//R×Ö¶Î£¬32Î»
    D_FFEC32 q7(D7,Clk,En,Clrn,Q7,Qn7);//R2×Ö¶Î£¬32Î»
    D_FFEC5 q8(D8,Clk,En,Clrn,Q8,Qn8);//Rd×Ö¶Î£¬5Î»
endmodule
