`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 15:13:04
// Design Name: 
// Module Name: INSTMEM_test
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


module INSTMEM_test;
    reg [31:0]Addr;
    wire [31:0]Inst;
    INSTMEM u(Addr,Inst);
    initial begin
        Addr=0;
    end
    always #1 Addr=Addr+1;
endmodule
