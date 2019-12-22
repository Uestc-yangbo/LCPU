`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 17:03:20
// Design Name: 
// Module Name: REG32
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


module REG32(D,En,Clk,Clrn,Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0);
    input[31:0]D,En;
    input Clk,Clrn;
    output[31:0]Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0;
    wire [31:0]Qn31,Qn30,Qn29,Qn28,Qn27,Qn26,Qn25,Qn24,Qn23,Qn22,Qn21,Qn20,Qn19,Qn18,Qn17,Qn16,Qn15,Qn14,Qn13,Qn12,Qn11,Qn10,Qn9,Qn8,Qn7,Qn6,Qn5,Qn4,Qn3,Qn2,Qn1,Qn0;
    D_FFEC32 q31(D,Clk,En[31],Clrn,Q31,Qn31);
    D_FFEC32 q30(D,Clk,En[30],Clrn,Q30,Qn30);
    D_FFEC32 q29(D,Clk,En[29],Clrn,Q29,Qn29);
    D_FFEC32 q28(D,Clk,En[28],Clrn,Q28,Qn28);
    D_FFEC32 q27(D,Clk,En[27],Clrn,Q27,Qn27);
    D_FFEC32 q26(D,Clk,En[26],Clrn,Q26,Qn26);
    D_FFEC32 q25(D,Clk,En[25],Clrn,Q25,Qn25);
    D_FFEC32 q24(D,Clk,En[24],Clrn,Q24,Qn24);
    D_FFEC32 q23(D,Clk,En[23],Clrn,Q23,Qn23);
    D_FFEC32 q22(D,Clk,En[22],Clrn,Q22,Qn22);
    D_FFEC32 q21(D,Clk,En[21],Clrn,Q21,Qn21);
    D_FFEC32 q20(D,Clk,En[20],Clrn,Q20,Qn20);
    D_FFEC32 q19(D,Clk,En[19],Clrn,Q19,Qn19);
    D_FFEC32 q18(D,Clk,En[18],Clrn,Q18,Qn18);
    D_FFEC32 q17(D,Clk,En[17],Clrn,Q17,Qn17);
    D_FFEC32 q16(D,Clk,En[16],Clrn,Q16,Qn16);
    D_FFEC32 q15(D,Clk,En[15],Clrn,Q15,Qn15);
    D_FFEC32 q14(D,Clk,En[14],Clrn,Q14,Qn14);
    D_FFEC32 q13(D,Clk,En[13],Clrn,Q13,Qn13);
    D_FFEC32 q12(D,Clk,En[12],Clrn,Q12,Qn12);
    D_FFEC32 q11(D,Clk,En[11],Clrn,Q11,Qn11);
    D_FFEC32 q10(D,Clk,En[10],Clrn,Q10,Qn10);
    D_FFEC32 q9(D,Clk,En[9],Clrn,Q9,Qn9);
    D_FFEC32 q8(D,Clk,En[8],Clrn,Q8,Qn8);
    D_FFEC32 q7(D,Clk,En[7],Clrn,Q7,Qn7);
    D_FFEC32 q6(D,Clk,En[6],Clrn,Q6,Qn6);
    D_FFEC32 q5(D,Clk,En[5],Clrn,Q5,Qn5);
    D_FFEC32 q4(D,Clk,En[4],Clrn,Q4,Qn4);
    D_FFEC32 q3(D,Clk,En[3],Clrn,Q3,Qn3);
    D_FFEC32 q2(D,Clk,En[2],Clrn,Q2,Qn2);
    D_FFEC32 q1(D,Clk,En[1],Clrn,Q1,Qn1);
    assign Q0=0;
    assign Qn0=0;
endmodule
