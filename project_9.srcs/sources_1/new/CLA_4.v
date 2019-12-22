`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/12 21:38:46
// Design Name: 
// Module Name: CLA_4
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


module CLA_4(X,Y,Cin,S,Cout);
    input [3:0]X,Y;
    output Cout;
    input Cin;
    output [3:0]S;
    and i0(Y_3,X[3],Y[3]);
    or i1(X_3,X[3],Y[3]);
    and i2(Y_2,X[2],Y[2]);
    or i3(X_2,X[2],Y[2]);
    and i4(Y_1,X[1],Y[1]);
    or i5(X_1,X[1],Y[1]);
    and i6(Y_0,X[0],Y[0]);
    or i7(X_0,X[0],Y[0]);
    not i01(Y_31,Y_3);
    nand i02(Y_32,X_3,Y_2);
    nand i03(Y_33,X_3,X_2,Y_1);
    nand i04(Y_34,X_3,X_2,X_1,Y_0);
    nand i05(Y_35,X_3,X_2,X_1,X_0,Cin);
    nand i00(Cout,Y_31,Y_32,Y_33,Y_34,Y_35);//Cout的输出门级电路实现
    not i_2(Y__3,Y_3);
    and i21(Y_21,Y__3,X_3);
    not i22(Y_22,Y_2);
    nand i23(Y_23,X_2,Y_1);
    nand i24(Y_24,X_2,X_1,Y_0);
    nand i25(Y_25,X_2,X_1,X_0,Cin);
    nand i26(Y_26,Y_22,Y_23,Y_24,Y_25);
    xor i20(S[3],Y_21,Y_26);//S3的输出门级电路实现
    not i_1(Y__2,Y_2);
    and i11(Y_11,Y__2,X_2);
    not i12(Y_12,Y_1);
    nand i13(Y_13,X_1,Y_0);
    nand i14(Y_14,X_1,X_0,Cin);
    nand i15(Y_15,Y_12,Y_13,Y_14);
    xor i10(S[2],Y_11,Y_15);//S2的输出门级电路实现
    not i_0(Y__1,Y_1);
    and i51(Y_51,Y__1,X_1);
    not i52(Y_52,Y_0);
    nand i53(Y_53,X_0,Cin);
    nand i54(Y_54,Y_52,Y_53);
    xor i50(S[1],Y_51,Y_54);//S1的输出门级电路
    not i41(Y__0,Y_0);
    and i42(Y_4,Y__0,X_0);
    xor i40(S[0],Y_4,Cin);//S0的输出门级电路
endmodule
