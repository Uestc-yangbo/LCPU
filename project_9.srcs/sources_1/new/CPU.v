`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/16 09:51:03
// Design Name: 
// Module Name: CPU
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


module CPU(Clk,En,Clrn,IF_ADDR,EX_X,EX_Y,EX_R);
    
    input Clk,En,Clrn;
    output[31:0] IF_ADDR,EX_R,EX_X,EX_Y;
    
    wire [31:0] IF_NEXTADDR,IF_Addr,IF_PCadd4,IF_Inst,D,D1,ID_Qa,ID_Qb,ID_PCadd4,ID_Inst,ID_InstL2,EX_InstL2,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,
        Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,
        Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
    wire [31:0] E_R1,E_R2,E_I,X,Y,E_R,EX_PC,EX_Inst,M_R,M_S,Dout,W_D,W_C,ID_EXTIMM,Alu_X,Alu_Y,ID_EXTIMM_L2,ID_PC,EX_PCadd4,M_PCadd4,W_PCadd4;
    wire [5:0] E_Op,E_Func;
    wire [4:0] ID_Wr,ID_Wr1,W_Wr,E_Rd,M_Rd;
    wire [3:0]Aluc,E_Aluc;
    wire [1:0]Pcsrc,FwdA,FwdB,E_FwdA,E_FwdB;
    wire Regrt,Se,Wreg,Aluqb,Reg2reg,Wmem,Z,Aluqa,jal,E_jal,M_jal,W_jal;
    wire E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb,Cout,M_Wreg,M_Reg2reg,M_Wmem,W_Wreg,W_Reg2reg,STALL,Condep;
    //对指令进行分解
    wire [4:0]rs,rt,rd,sa;
    wire [5:0]op,func;
    wire [15:0]immediate;
    wire [25:0]address;
    assign op=ID_Inst[31:26];
    assign func=ID_Inst[5:0];
    assign rs=ID_Inst[25:21];
    assign rt=ID_Inst[20:16];
    assign rd=ID_Inst[15:11];
    assign sa=ID_Inst[10:6];
    assign immediate=ID_Inst[15:0];
    assign address=ID_Inst[25:0];
    //IF级
    //MUX4X32 对当前pc寄存器的输入端进行选择
    MUX4X32 MUX4X32_0(IF_PCadd4,EX_PC,Alu_X,EX_InstL2,Pcsrc,IF_NEXTADDR);
    //PC 给出指令地址
    PC PC_0(IF_NEXTADDR,Clk,En,Clrn,IF_Addr,STALL);
    //PCadd4 pc+4后的值
    PCadd4 PCadd4_0(IF_Addr,IF_PCadd4);
    //INSTMEM 根据指令地址取出指令
    INSTMEM INSTMEM_0(IF_Addr,IF_Inst);
    //REG_IFID IF/ID级寄存器
    REG_IFID REG_IFID_0(IF_PCadd4,IF_Inst,En,Clk,Clrn,ID_PCadd4,ID_Inst,STALL,Condep);
    
    //ID级
    //CONUNIT 控制模块
    CONUNIT CONUNIT_0(E_Op,op,E_Func,func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,Aluqa,jal,rs,rt,E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,STALL,Condep);
    //MUX2X5_0 首先根据I型指令和R型指令对写入寄存器号进行选择
    MUX2X5 MUX2X5_0(rd,rt,Regrt,ID_Wr1);
    //MUX2X5_1 然后再根据jal指令把31号寄存器进行选择写入寄存器号
    MUX2X5 MUX2X5_1(ID_Wr1,31,jal,ID_Wr);
    //EXT16T32 对立即数进行符号扩展或0扩展
    EXT16T32 EXT16T32_0(immediate,Se,ID_EXTIMM);
    //REGFILE_DOWN 下降沿寄存器堆
    REGFILE_DOWN REGFILE_DOWN_0(rs,rt,D,W_Wr,W_Wreg,Clk,Clrn,ID_Qa,ID_Qb,Q0_reg32,Q1_reg32,Q2_reg32,Q3_reg32,Q4_reg32,Q5_reg32,Q6_reg32,
    Q7_reg32,Q8_reg32,Q9_reg32,Q10_reg32,Q11_reg32,Q12_reg32,Q13_reg32,Q14_reg32,Q15_reg32,Q16_reg32,Q17_reg32,Q18_reg32,
    Q19_reg32,Q20_reg32,Q21_reg32,Q22_reg32,Q23_reg32,Q24_reg32,Q25_reg32,Q26_reg32,Q27_reg32,Q28_reg32,Q29_reg32,Q30_reg32,
    Q31_reg32);
    //SHIFTER32_L2 将立即数左移两位
    SHIFTER32_L2 SHIFTER32_L2_0(ID_EXTIMM,ID_EXTIMM_L2);
    //SHIFTER_COMBINATION J型指令跳转地址拼接模块
    SHIFTER_COMBINATION SHIFTER_COMBINATION_0(address,ID_PCadd4,ID_InstL2);
    //CLA_32 在ID级就直接计算出beq和bne需要跳转的地址
    CLA_32 CLA_32_0(ID_PCadd4,ID_EXTIMM_L2,0,ID_PC,Cout);

    //REG_IDEX ID/EX级寄存器
    REG_IDEX REG_IDEX_0(func,jal,ID_PCadd4,ID_InstL2,ID_PC,Wreg,Reg2reg,Wmem,op,Aluc,Aluqb,ID_Inst,ID_Qa,ID_Qb,ID_EXTIMM,ID_Wr,En,Clk,Clrn,E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqb,EX_Inst,E_R1,E_R2,E_I,E_Rd,FwdA,FwdB,E_FwdA,E_FwdB,EX_PC,EX_InstL2,EX_PCadd4,E_jal,E_Func,Condep,Aluqa,E_Aluqa);
    
    //EX级
    //MUX4X32_1 根据信号选择X端口的数据前推
    MUX4X32 MUX4X32_1(E_R1,D1,M_R,0,E_FwdA,Alu_X);
    //MUX4X32_2 根据信号选择Y端口的数据前推
    MUX4X32 MUX4X32_2(E_R2,D1,M_R,0,E_FwdB,Alu_Y);
    //MUX2X32_1 选择Y端口的值，I型指令需要
    MUX2X32 MUX2X32_1(E_I,Alu_Y,E_Aluqb,Y);
    //MUX2X32_2 选择X端口的值,R型移位指令需要
    MUX2X32 MUX2X32_2(Alu_X,EX_Inst,E_Aluqa,X);
    //ALU 算数逻辑单元
    ALU ALU_0(X,Y,E_Aluc,E_R,Z);
    //REG_EXMEM EX/MEM级寄存器
    REG_EXMEM REG_EXMEM_0(E_jal,EX_PCadd4,E_Wreg,E_Reg2reg,E_Wmem,E_R,E_R2,E_Rd,En,Clk,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_R,M_S,M_Rd,M_PCadd4,M_jal);
    
    //MEM级
    //DATAMEM 数据存储单元
    DATAMEM DATAMEM_0(M_R,M_S,Clk,M_Wmem,Dout);
    //REG_MEMWB MEN/WB级寄存器
    REG_MEMWB REG_MEMWB_0(M_jal,M_PCadd4,M_Wreg,M_Reg2reg,M_R,Dout,M_Rd,En,Clk,Clrn,W_Wreg,W_Reg2reg,W_D,W_C,W_Wr,W_PCadd4,W_jal);
    
    //WB级
    //MUX2X32_3 选择存储器的值或ALU计算出的值
    MUX2X32 MUX2X32_3(W_C,W_D,W_Reg2reg,D1);
    //MUX2X32_0 根据jal指令对写入的值进行选择，这里是pc+4的值
    MUX2X32 MUX2X32_0(D1,W_PCadd4,W_jal,D);
    
    assign IF_ADDR=IF_Addr;
    assign EX_R=E_R;
    assign EX_X=X;
    assign EX_Y=Y;
endmodule
