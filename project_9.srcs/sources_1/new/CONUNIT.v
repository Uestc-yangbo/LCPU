`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/13 16:43:51
// Design Name: 
// Module Name: CONUNIT
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
module CONUNIT(E_Op,Op,E_Func,Func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,Aluqa,jal,Rs,Rt,E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,STALL,Condep);
    input [5:0]Op,Func,E_Op,E_Func;
    input Z;
    input E_Wreg,M_Wreg,E_Reg2reg;
    input [4:0]E_Rd,M_Rd,Rs,Rt;
    output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,STALL,Condep;
    output [1:0]Pcsrc;
    output [3:0]Aluc;
    output Aluqa;
    output jal;
    output reg [1:0]FwdA,FwdB;
    wire R_type=~|Op;
    wire RE_type=~|E_Op;

    //R型指令
    wire I_add=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
    wire I_sub=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
    wire I_and=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&~Func[0];
    wire I_or=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&Func[0];
    wire I_xor=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&Func[1]&~Func[0];
    wire I_sll=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
    wire I_srl=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
    wire I_sra=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&Func[0];
    wire I_jr=R_type&~Func[5]&~Func[4]&Func[3]&~Func[2]&~Func[1]&~Func[0];
    wire E_jr=RE_type&~E_Func[5]&~E_Func[4]&E_Func[3]&~E_Func[2]&~E_Func[1]&~E_Func[0];

    //I型指令
    wire I_addi=~Op[5]&~Op[4]&Op[3]&~Op[2]&~Op[1]&~Op[0];
    wire I_andi=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&~Op[0];
    wire I_ori=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&Op[0];
    wire I_xori=~Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&~Op[0];
    wire I_lw=Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
    wire I_sw=Op[5]&~Op[4]&Op[3]&~Op[2]&Op[1]&Op[0];
    wire I_beq=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&~Op[0];
    wire I_bne=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
    wire I_lui=~Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&Op[0];
    wire E_beq=~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&~E_Op[0];
    wire E_bne =~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&E_Op[0];

    //J型指令
    wire I_j=~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&~Op[0];
    wire I_jal=~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
    wire E_j=~E_Op[5]&~E_Op[4]&~E_Op[3]&~E_Op[2]&E_Op[1]&~E_Op[0];
    wire E_jal=~E_Op[5]&~E_Op[4]&~E_Op[3]&~E_Op[2]&E_Op[1]&E_Op[0];

    wire E_Inst = I_add|I_sub|I_and|I_or|I_sw|I_beq|I_bne;
    assign Wreg = I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_or|I_xori|I_lw|I_lui|I_jal;
    assign Regrt = I_addi|I_andi|I_ori|I_xori|I_lw|I_sw|I_lui|I_beq|I_bne|I_j|I_jal;
    assign Reg2reg  = I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_xori|I_sw|I_beq|I_bne|I_j|I_jal|I_lui;
    assign Aluqb = I_add | I_sub | I_and | I_or | I_xor | I_sll | I_srl | I_sra | I_beq | I_bne |I_j;
    assign Se   = I_addi | I_lw | I_sw | I_beq | I_bne;
    assign Aluc[3] = I_sra;
    assign Aluc[2] = I_xor |I_lui | I_sll | I_srl | I_sra |I_xori;
    assign Aluc[1] = I_and | I_or | I_lui | I_srl | I_sra | I_andi | I_ori;
    assign Aluc[0] = I_sub | I_ori | I_or | I_sll | I_srl |I_sra| I_beq | I_bne;
    assign Wmem = I_sw;
    assign Pcsrc[0] = E_jal | E_j | (E_beq&Z) | (E_bne&~Z);
    assign Pcsrc[1] = E_j | E_jr | E_jal;
    assign Aluqa = I_sll | I_srl | I_sra;
    assign jal = I_jal;
    always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt)begin
        FwdA=2'b00;
        if((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
            FwdA=2'b10;
        end else begin
            if((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
                FwdA=2'b01;
            end
        end
    end
    always @(E_Rd,M_Rd,E_Wreg,M_Wreg,Rt,I_add,I_sub,I_and,I_or,I_sw,I_beq,I_bne)begin
        FwdB=2'b00;
        if((Rt==E_Rd)&((I_add==1)|(I_sub==1)|(I_and==1)|(I_or==1)|(I_sw==1)|(I_beq==1)|(I_bne==1)|(I_xor==1)|(I_sll==1)|(I_srl==1)|(I_sra==1))&(E_Rd!=0)&(E_Wreg==1))begin//条件c
            FwdB=2'b10;
        end else begin
            if((Rt==M_Rd)&((I_add==1)|(I_sub==1)|(I_and==1)|(I_or==1)|(I_sw==1)|(I_beq==1)|(I_bne==1)|(I_xor==1)|(I_sll==1)|(I_srl==1)|(I_sra==1))&(M_Rd!=0)&(M_Wreg==1))begin//条件d
                FwdB=2'b01;
            end
        end
    end
    assign STALL=((Rs==E_Rd)|(Rt==E_Rd))&(E_Reg2reg==0)&(E_Rd!=0)&(E_Wreg==1);
    assign Condep=(E_j)|(E_jal)|(E_jr)|(E_beq&Z)|(E_bne&~Z);
endmodule