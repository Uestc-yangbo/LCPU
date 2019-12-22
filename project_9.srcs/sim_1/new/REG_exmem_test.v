`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 20:08:07
// Design Name: 
// Module Name: REG_exmem_test
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


module REG_exmem_test;
    reg [31:0]D6,D7;
    reg [4:0]D8;
    reg D0,D1,D2;
    
    reg En,Clk,Clrn;
    wire [31:0] Q6,Q7;
    wire [4:0]Q8; 
    wire Q0,Q1,Q2;
    REG_EXMEM u(D0,D1,D2,D6,D7,D8,En,Clk,Clrn,Q0,Q1,Q2,Q6,Q7,Q8);
    initial begin
        D0=1;
        D6=2;
        D2=1;
        D1=1;
        D7=0;
        D8=0;
        En=1;
        Clk=0;
        Clrn=0;
    end
    always #2 D0=D0+1;
    always #1 D1=D1+1;
    always #3 D2=D2+1;
    always #2 D6=D6+1;
    always #2 D7=D7+1;
    always #2 D8=D8+1;
    always #0.8 Clk=Clk+1;
    always #2 Clrn=1;
endmodule
