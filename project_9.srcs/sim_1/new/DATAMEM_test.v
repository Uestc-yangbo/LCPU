`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 15:18:26
// Design Name: 
// Module Name: DATAMEM_test
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


module DATAMEM_test;
    reg [31:0]Addr,Din;
    reg Clk,We;
    wire [31:0]Dout;
    DATAMEM u(Addr,Din,Clk,We,Dout);
    initial begin
        Addr=0;
        Din=0;
        Clk=0;
        We=1;
    end
    always #0.2 Clk=Clk+1;
    always #0.1 Addr=Addr+1;
    always #0.2 Din=Din+1;
endmodule
