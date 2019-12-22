`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 18:48:17
// Design Name: 
// Module Name: test2
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


module test2;
    reg [4:0] I;
    reg En;
    wire [31:0] Y;
    DEC5T32E u(I,En,Y);
    initial begin
        I=0;
        En=1;
    end
    always #1 I=I+1;
endmodule
