`timescale 1 ps / 100 fs
module ALUControlUnit (ALUOp, Funct, ALUControl);

// setting the ports
input [1:0] ALUOp;
input [5:0] Funct;
output [2:0] ALUControl;
wire [2:0] ALUControl;


//finding ALUControl[2]
assign ALUControl[2] = (~ALUOp[1]&ALUOp[0])|(ALUOp[1]&ALUOp[0]);
//finding ALUControl[1]
assign ALUControl[1] = (~ALUOp[1]&(~ALUOp[0]))|((~ALUOp[0]&ALUOp[1])&(~Funct[2]&(~Funct[0])))|(~ALUOp[1]&ALUOp[0])|(ALUOp[1]&ALUOp[0]);
//findign ALUControl[0]
assign ALUControl[0] = (~ALUOp[0]&ALUOp[1]&Funct[2]&Funct[0])|(ALUOp[1]&ALUOp[0]);
	
endmodule
