`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 18:34:44
// Design Name: 
// Module Name: REG_IDEX
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


module REG_IDEX(D17,D16,D15,D14,D13,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,D11,D12,Q11,Q12,Q13,Q14,Q15,Q16,Q17,condep,D18,Q18);
    input [31:0] D15,D14,D6,D7,D8,D9,D13;
    input [5:0]D3,D17;
    input [4:0]D10;
    input [3:0]D4;
    input [1:0]D11,D12;
    input D0,D1,D2,D5,D16,D18;
    input En,Clk,Clrn,condep;
    
    output [31:0] Q15,Q14,Q6,Q7,Q8,Q9,Q13;
    output [5:0] Q3,Q17;
    output [4:0]Q10;
    output [3:0]Q4;
    output [1:0]Q11,Q12;
    output Q0,Q1,Q2,Q5,Q16,Q18;
    
    wire [31:0] Qn15,Qn6,Qn7,Qn8,Qn9,Qn13,Qn14;
    wire [5:0] Qn3,Qn17;
    wire [4:0]Qn10;
    wire [3:0]Qn4;
    wire [1:0]Qn11,Qn12;
    wire Qn0,Qn1,Qn2,Qn5,Qn16,Qn18;
    wire Clrn_SC;
    assign Clrn_SC=Clrn&~condep;
    
    D_FFEC q0(D0,Clk,En,Clrn_SC,Q0,Qn0);//Wreg�ֶΣ�1λ
    D_FFEC q1(D1,Clk,En,Clrn_SC,Q1,Qn1);//Reg2reg�ֶΣ�1λ
    D_FFEC q2(D2,Clk,En,Clrn_SC,Q2,Qn2);//Wmem�ֶΣ�1λ
    D_FFEC6 q3(D3,Clk,En,Clrn_SC,Q3,Qn3);//op�ֶΣ�6λ
    D_FFEC4 q4(D4,Clk,En,Clrn_SC,Q4,Qn4);//Aluc�ֶΣ�6λ
    D_FFEC q5(D5,Clk,En,Clrn_SC,Q5,Qn5);//Aluqb�ֶΣ�1λ
    D_FFEC32 q6(D6,Clk,En,Clrn_SC,Q6,Qn6);//ID_Inst�ֶΣ�32λ,�𵽴���sa������
    D_FFEC32 q7(D7,Clk,En,Clrn_SC,Q7,Qn7);//ID_Qa�ֶΣ�32λ
    D_FFEC32 q8(D8,Clk,En,Clrn_SC,Q8,Qn8);//ID_Qb�ֶΣ�32λ
    D_FFEC32 q9(D9,Clk,En,Clrn_SC,Q9,Qn9);//ID_EXTIMM�ֶΣ�32λ
    D_FFEC5 q10(D10,Clk,En,Clrn_SC,Q10,Qn10);//ID_Wr�ֶΣ�5λ
    D_FFEC2 q11(D11,Clk,En,Clrn_SC,Q11,Qn11);//FwdA�ֶΣ�2λ
    D_FFEC2 q12(D12,Clk,En,Clrn_SC,Q12,Qn12);//FwdB�ֶΣ�2λ
    D_FFEC32 q13(D13,Clk,En,Clrn_SC,Q13,Qn13);//ID_PC�ֶΣ�32λ
    D_FFEC32 q14(D14,Clk,En,Clrn_SC,Q14,Qn14);//ID_InstL2�ֶΣ���beq��bneָ����ת�ĵ�ַ��32λ
    D_FFEC32 q15(D15,Clk,En,Clrn_SC,Q15,Qn15);//ID_PCadd4�ֶΣ�����ID����ָ���ַд����32λ
    D_FFEC q16(D16,Clk,En,Clrn_SC,Q16,Qn16);//jal�ֶΣ�1λ
    D_FFEC6 q17(D17,Clk,En,Clrn_SC,Q17,Qn17);//func�ֶΣ�6λ
    D_FFEC q18(D18,Clk,En,Clrn_SC,Q18,Qn18);//Aluqa�ֶΣ�1λ
endmodule