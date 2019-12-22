`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 16:49:14
// Design Name: 
// Module Name: ALU
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


module ALU(X,Y,Aluc,R,Z);
    input[31:0]X,Y;
    input[3:0]Aluc;
    output[31:0]R;
    output Z;
    wire[31:0]d_as,d_and,d_or,d_xor,d_lui,d_sh,d;
    ADDSUB_32 as32(X,Y,Aluc[0],d_as);
    assign d_and=X&Y;
    assign d_or=X|Y;
    assign d_xor=X^Y;
    assign d_lui={Y[15:0],16'h0};
    SHIFTER shift(Y,X[10:6],Aluc[3],Aluc[1],d_sh);
    MUX6X32 select(d_and,d_or,d_xor,d_lui,d_sh,d_as,Aluc[3:0],R);
    assign Z=~|R;
endmodule
