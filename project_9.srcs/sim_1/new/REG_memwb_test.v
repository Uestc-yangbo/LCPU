`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 20:23:46
// Design Name: 
// Module Name: REG_memwb_test
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


module REG_memwb_test;
    reg D0,D1;
    reg [31:0] D2,D3;
    reg [4:0] D4;
    reg En,Clk,Clrn;
    wire Q0,Q1;
    wire [31:0] Q2,Q3;
    wire [4:0] Q4;
    REG_MEMWB u(D0,D1,D2,D3,D4,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4);
    initial begin
        D0=1;
        D1=0;
        D2=0;
        D3=0;
        D4=0;
        En=1;
        Clk=0;
        Clrn=0;
    end
    always #2 D0=D0+1;
    always #2 D1=D1+1;
    always #2 D2=D2+1;
    always #2 D3=D3+1;
    always #2 D4=D4+1;
    always #0.6 Clk=Clk+1;
    always #2 Clrn=1;
endmodule
