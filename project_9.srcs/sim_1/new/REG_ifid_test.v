`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 09:15:36
// Design Name: 
// Module Name: REG_ifid_test
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

module REG_ifid_test;
    reg [31:0]D0,D1;
    reg En,Clk,Clrn;
    reg stall,condep;
    wire [31:0]Q0,Q1;
    REG_IFID u(D0,D1,En,Clk,Clrn,Q0,Q1,stall,condep);
    initial begin
        D0=1;
        D1=1;
        En=1;
        Clk=0;
        Clrn=1;
        condep=0;
        stall=0;
    end
    always #2 D1=D1+1;
    always #2 Clk=Clk+1;
    always #40 condep=condep+1;
    always #20 stall=stall+1;
endmodule
