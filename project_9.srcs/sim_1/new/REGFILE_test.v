`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 23:09:02
// Design Name: 
// Module Name: REGFILE_test
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


module REGFILE_DOWN_test;
    reg [4:0]Ra,Rb,Wr;
    reg [31:0]D;
    reg We,Clk,Clrn;
    wire [31:0]Qa,Qb,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,
    Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,
    Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
    REGFILE_DOWN u(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb,Q0_reg32,Q1_reg32,Q2_reg32,Q3_reg32,Q4_reg32,Q5_reg32,Q6_reg32,
    Q7_reg32,Q8_reg32,Q9_reg32,Q10_reg32,Q11_reg32,Q12_reg32,Q13_reg32,Q14_reg32,Q15_reg32,Q16_reg32,Q17_reg32,Q18_reg32,
    Q19_reg32,Q20_reg32,Q21_reg32,Q22_reg32,Q23_reg32,Q24_reg32,Q25_reg32,Q26_reg32,Q27_reg32,Q28_reg32,Q29_reg32,Q30_reg32,
    Q31_reg32);;
    initial begin
           Ra=1;
           Rb=1;
           Wr=1;
           D=0;
           We=1;
           Clk=0;
           Clrn=1;
        end
        always #50 Ra=Ra+1;
        always #50 Rb=Rb+1;
        always #50 Wr=Wr+1;
        always #0.02 D=D+1;
        always #0.19 Clk=~Clk;
endmodule
