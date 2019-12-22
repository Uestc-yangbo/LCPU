`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/13 16:29:48
// Design Name: 
// Module Name: DATAMEM
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


module DATAMEM(Addr,Din,Clk,We,Dout);
    input [31:0]Addr,Din;
    input Clk,We;
    output [31:0]Dout;
	reg [31:0]ram[0:31];
	integer i;
	initial begin
        for ( i = 0 ; i <= 31 ; i = i + 1) 
            ram [i] = 0;
    end
	always @ (posedge Clk) begin
        if (We) ram[Addr[6:2]] <= Din;
	end
	assign Dout = ram[Addr[6:2]];
endmodule

