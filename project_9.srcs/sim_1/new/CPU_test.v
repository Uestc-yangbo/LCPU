`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 08:32:54
// Design Name: 
// Module Name: CPU_test
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


module CPU_test;
    reg Clk,En,Clrn;
    wire[31:0] IF_ADDR,EX_R,EX_X,EX_Y;
    CPU u(Clk,En,Clrn,IF_ADDR,EX_X,EX_Y,EX_R);
    initial begin 
        Clk=0;
        Clrn=0;
        En=1;
        #40
        Clrn<=1;
    end
    always #15 Clk=~Clk;
endmodule
