module ALUControlUnit (ALUOp, Funct, ALUControl);

// setting the ports
input [1:0] ALUOp;
input [5:0] Funct;
output [2:0] ALUControl;
reg [2:0] ALUControl;

always @(*)
	begin
	//finding ALUControl[2]
	ALUControl[2] = (~ALUOp[1]&ALUOp[0])|(ALUOp[1]&ALUOp[0]);
	//finding ALUControl[1]
	ALUControl[1] = (~ALUOp[1]&(~ALUOp[0]))|((~ALUOp[0]&ALUOp[1])&(~Funct[2]&(~Funct[0])))|(~ALUOp[1]&ALUOp[0])|(ALUOp[1]&ALUOp[0]);
	//findign ALUControl[0]
	ALUControl[0] = (~ALUOp[0]&ALUOp[1]&Funct[2]&Funct[0])|(ALUOp[1]&ALUOp[0]);
	end
	
endmodule