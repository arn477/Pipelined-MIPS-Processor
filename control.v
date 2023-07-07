module control (opCode, RegDst, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);

//declaring the input and output ports
input [5:0] opCode;
//need to declare outputs as registers because we will be storing values within them
output RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump;
reg RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump;
output [1:0] ALUOp;
reg[1:0] ALUOp;

always @(*)
	case(opCode)
		//signals for load word
		6'b100011:  begin
						RegDst = 1'b0;
						Branch = 1'b0;
						MemRead = 1'b1;
						MemToReg = 1'b1;
						ALUOp = 2'b00;
						MemWrite = 1'b0;
						ALUSrc = 1'b1;
						RegWrite = 1'b1;
						Jump = 1'b0;
						end
		//signals for store word
		6'b101011:  begin
						RegDst = 1'bx;
						Branch = 1'b0;
						MemRead = 1'b0;
						MemToReg = 1'bx;
						ALUOp = 2'b00;
						MemWrite = 1'b1;
						ALUSrc = 1'b1;
						RegWrite = 1'b0;
						Jump = 1'b0;
						end
		//signals for R-format
		6'b000000:  begin
						RegDst = 1'b1;
						Branch = 1'b0;
						MemRead = 1'b0;
						MemToReg = 1'b0;
						ALUOp = 2'b10;
						MemWrite = 1'b0;
						ALUSrc = 1'b0;
						RegWrite = 1'b1;
						Jump = 1'b0;
						end
		//signals for addi
		6'b001000:  begin
						RegDst = 1'b0;
						Branch = 1'b0;

						MemToReg = 1'b0;
						ALUOp = 2'b00;
						MemWrite = 1'b0;
						ALUSrc = 1'b1;
						RegWrite = 1'b1;
						Jump = 1'b0;
						end
		//signals for beq
		6'b000100:  begin
						RegDst = 1'bx;
						Branch = 1'b1;
						MemRead = 1'b0;
						MemToReg = 1'bx;
						ALUOp = 2'b01;
						MemWrite = 1'b0;
						ALUSrc = 1'b0;
						RegWrite = 1'b0;
						Jump = 1'b0;
						end
		//signals for slti
		6'b001010:  begin
						RegDst = 1'b0;
						Branch = 1'b0;
						MemRead = 1'b0;
						MemToReg = 1'b0;
						ALUOp = 2'b11;
						MemWrite = 1'b0;
						ALUSrc = 1'b1;
						RegWrite = 1'b1;
						Jump = 1'b0;
						end
		//signals for jump
		6'b000010:  begin
						RegDst = 1'bx;
						Branch = 1'b0;
						MemRead = 1'b0;
						MemToReg = 1'bx;
						ALUOp = 2'bxx;
						MemWrite = 1'b0;
						ALUSrc = 1'bx;
						RegWrite = 1'b0;
						Jump = 1'b1;
						end
	endcase
endmodule 