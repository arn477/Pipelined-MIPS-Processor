`timescale 1 ps / 100 fs
module forwardingUnit(MEM_RegWrite, MEM_Rd, WB_RegWrite, WB_Rd, EX_Rs, EX_Rt, EX_MemRead, EX_MemWrite, forwardA, forwardB, forwardC);
input MEM_RegWrite, WB_RegWrite, EX_MemRead, EX_MemWrite;
input [4:0] MEM_Rd, WB_Rd, EX_Rs, EX_Rt;
output [1:0] forwardA, forwardB, forwardC;
reg [1:0] forwardA, forwardB, forwardC;

always @(*)
begin 
	forwardA = 2'b00;
	forwardB = 2'b00;
	forwardC = 2'b00;
	
	if (MEM_RegWrite && (MEM_Rd != 0) && (MEM_Rd == EX_Rs))
		forwardA = 2'b10;
		
	if (MEM_RegWrite && (MEM_Rd != 0) && (MEM_Rd == EX_Rt) && (EX_MemRead != 1) && (EX_MemWrite != 1))
		forwardB = 2'b10;

	if (WB_RegWrite && (WB_Rd != 0) && (~(MEM_RegWrite && (MEM_Rd != 0) && (MEM_Rd == EX_Rs))) && (WB_Rd == EX_Rs))
		forwardA = 2'b01;

	if (WB_RegWrite && (WB_Rd != 0) && (~(MEM_RegWrite & (MEM_Rd != 0) && (MEM_Rd == EX_Rt))) && (WB_Rd == EX_Rt) && (EX_MemRead != 1) && (EX_MemWrite != 1))
		forwardB = 2'b01;
		
	if (MEM_RegWrite && EX_MemWrite && (MEM_Rd == EX_Rt))
		forwardC = 2'b10;
	
	if (WB_RegWrite && EX_MemWrite && (WB_Rd == EX_Rt))
		forwardC = 2'b01;
end

endmodule
