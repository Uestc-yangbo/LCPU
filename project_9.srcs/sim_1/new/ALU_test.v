`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 22:06:56
// Design Name: 
// Module Name: ALU_test
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

module ALU_test;
    reg [31:0]X,Y;
    reg [3:0]Aluc;
    wire Z;
    wire [31:0]R;
    ALU u(.X(X),.Y(Y),.Aluc(Aluc),.R(R),.Z(Z));
    initial begin
        X=0;
        Y=0;
        Aluc=0;
    end
    always #0.01 X=X+1;
    always #0.02 Y=Y+1;
    always #0.04 Aluc=Aluc+1;
endmodule