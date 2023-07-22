module CPU (clk, reset);
input clk, reset;
// IF
wire[31:0] pc, pcIn, pc4, instruction, branch_addr, jump_addr; 
wire pcWrite_en, tmp, IF_Reset, IF_Write;
wire[31:0] ID_PC4, ID_Instruction;
// ID
wire[5:0] opCode;
wire[4:0] rs, rt, rd;
wire [15:0] imm;
wire RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump, resetIdControl;
wire [1:0] ALUOp;
wire [31:0] readData1, readData2, seImm;
//EX
wire [4:0] EX_rt, EX_rd, EX_rs, EX_writeReg;
wire [31:0] EX_readData1, EX_readData2, EX_Instruction, EX_Imm, EX_PC4;
wire ID_Reset, EX_RegDst, EX_Branch, EX_MemRead, EX_MemToReg, EX_MemWrite, EX_ALUSrc, EX_RegWrite, EX_Jump;
wire [1:0] EX_ALUOp, forwardA, forwardB;
wire [31:0] ALUInput1, ALUInput2, ALUOut, branchOffset, EX_branch_addr, EX_jump_addr, muxOut, shiftedJumpInstructionValue;
wire [25:0] jumpInstructionValue;
wire [2:0] ALUControl;
wire [5:0] functionCode;
wire zero, overflow;
//MEM
wire [31:0] MEM_ALUOut, MEM_readData2;
wire [4:0] MEM_writeReg;
wire MEM_RegWrite, MEM_zero, MEM_Jump, MEM_Branch, MEM_MemWrite, MEM_MemToReg, MEM_MemRead, MEM_pcBranch;
//WB
wire WB_RegWrite;
wire [4:0] WB_writeReg;
wire [31:0] WB_writeData;

//====================Instruction Fetch Stage====================
//======PC Register======

//declare a 32 bit register to be our pc
busMux21 branchMux(pc4, branch_addr, tmp, MEM_pcBranch); //choose branch address if pcBranch is 1
busMux21 jumpMux(tmp, jump_addr, pcIn, MEM_jump);

pipelineReg pcRegister(pc, pcIn, pcWrite_en, reset, clk);
adder32Bit pcAdder (pc, {29'b0,3'b100}, pc4); //pc4 = pcOut + 4

InstructionMem instructions(instruction, pc);

assign IF_Reset = reset | MEM_pcBranch | MEM_jump;

//======IF pipeline registers======
pipelineReg IF_PC4(ID_PC4, pc4, IF_Write, IF_Reset, clk);
pipelineReg IF_Instructions(ID_Instruction, instruction, IF_Write, IF_Reset, clk);


//====================Instruction Decode Stage====================
assign opCode = ID_Instruction[31:26];
assign rs = ID_Instruction[25:21];
assign rt = ID_Instruction[20:16];
assign imm = ID_Instruction[15:0];

//======Control Unit and Registers======
control mainControl(opCode, RegDst, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);
register_file registers (WB_writeData, readData1, readData2, rs, rt, WB_writeReg, WB_RegWrite, reset, clk);

signExtend se (imm, seImm);

//======Stall control unit======
stallControlUnit stall (EX_MemRead, EX_rt, rs, rt, IF_Write, pcWrite_en, resetIdControl);

//======ID pipeline registers======
assign ID_Reset = IF_Reset | resetIdControl;

pipelineReg ID_PC4reg(EX_PC4, ID_PC4, 1'b1, ID_Reset, clk);
pipelineReg ID_rd1(EX_readData1, readData1, 1'b1, ID_Reset, clk);
pipelineReg ID_rd2(EX_readData2, readData2, 1'b1, ID_Reset, clk);
pipelineReg ID_Inst(EX_Instruction, ID_Instruction, 1'b1, ID_Reset, clk);
pipelineReg ID_imm(EX_Imm, seImm, 1'b1, ID_Reset, clk);
reg1bit ID_RegDst(EX_RegDst, RegDst, 1'b1, ID_Reset, clk);
reg1bit ID_Branch(EX_Branch, Branch, 1'b1, ID_Reset, clk);
reg1bit ID_MemRead(EX_MemRead, MemRead, 1'b1, ID_Reset, clk);
reg1bit ID_MemToReg(EX_MemToReg, MemToReg, 1'b1, ID_Reset, clk);
reg1bit ID_ALUOp1(EX_ALUOp[1], ALUOp[1], 1'b1, ID_Reset, clk);
reg1bit ID_ALUOp0(EX_ALUOp[0], ALUOp[0], 1'b1, ID_Reset, clk);
reg1bit ID_MemWrite(EX_MemWrite, MemWrite, 1'b1, ID_Reset, clk);
reg1bit ID_ALUSrc(EX_ALUSrc, ALUSrc, 1'b1, ID_Reset, clk);
reg1bit ID_RegWrite(EX_RegWrite, RegWrite, 1'b1, ID_Reset, clk);
reg1bit ID_Jump(EX_Jump, Jump, 1'b1, ID_Reset, clk);


//====================EXecution Stage====================
//======forwarding unit======
assign EX_rt = EX_Instruction[20:16];
assign EX_rs = EX_Instruction[25:21];

forwardingUnit forwardUnit (MEM_RegWrite, MEM_writeReg, WB_RegWrite, WB_writeReg, EX_rs, EX_rt, forwardA, forwardB);

//======ALU======
busMux21 aluSource(EX_readData2, EX_Imm, muxOut, EX_ALUSrc);
busMux31 aluIn1 (EX_readData1, WB_writeData, MEM_ALUOut, ALUInput1, forwardA);
busMux31 aluIn2 (muxOut, WB_writeData, MEM_ALUOut, ALUInput2, forwardB);
assign functionCode = EX_Instruction[5:0];

ALUControlUnit controlAlu (EX_ALUOp, functionCode, ALUControl);
ALU aluUnit(ALUInput1, ALUInput2, ALUControl, ALUOut, zero, overflow);

//======Branch Address======
shiftLeft2 shiftLeftbranch(EX_Imm, branchOffset);
adder32Bit branchAdder(EX_PC4, branchOffset, EX_branch_addr);

//======Jump Address======
assign jumpInstructionValue = EX_Instruction[25:0];
shiftLeft2 shiftLeftJump({6'b0,jumpInstructionValue}, shiftedJumpInstructionValue);
assign EX_jump_addr = {EX_PC4[31:28], shiftedJumpInstructionValue[27:0]};

//======write register======
assign EX_rd = EX_Instruction[15:11];
bit5BusMux destinationMux(EX_rt, EX_rd, EX_writeReg, EX_RegDst);

//======EX pipeline registers======
pipelineReg EX_jumpaddress (jump_addr, EX_jump_addr, 1'b1, reset, clk);
pipelineReg EX_branchaddress(branch_addr, EX_branch_addr, 1'b1, reset, clk);
pipelineReg EX_ALUOut(MEM_ALUOut, ALUOut, 1'b1, reset, clk);
pipelineReg EX_readData2reg(MEM_readData2, EX_readData2, 1'b1, reset, clk);
reg5bit EX_writeRegister(MEM_writeReg, EX_writeReg, 1'b1, reset, clk);
reg1bit zeroBit(MEM_zero, zero, 1'b1, reset, clk);
reg1bit branchBit(MEM_Branch, EX_Branch, 1'b1, reset, clk);
reg1bit jumpBit(MEM_Jump, EX_Jump, 1'b1, reset, clk);
reg1bit regWriteBit(MEM_RegWrite, EX_RegWrite, 1'b1, reset, clk);
reg1bit memReadBit(MEM_MemRead, EX_MemRead, 1'b1, reset, clk);
reg1bit memToRegBit(MEM_MemToReg, EX_MemToReg, 1'b1, reset, clk);
reg1bit memWriteBit(MEM_MemWrite, EX_MemWrite, 1'b1, reset, clk);

//====================Memory Stage====================

endmodule