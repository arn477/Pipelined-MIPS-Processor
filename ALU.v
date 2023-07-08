module ALU(A, B, ALUControl, out, zero);
	input [31:0] A, B;
	input [2:0] ALUControl;
	output [31:0] out; 
	output zero;
	wire [31:0] carryOut;
	wire setLess;
	
	ALU1Bit alu0 (A[0], B[0], ALUControl, setLess, ALUControl[2], out[0], carryOut[0]);
	ALU1Bit alu1 (A[1], B[1], ALUControl, 0, carryOut[0], out[1], carryOut[1]);
	ALU1Bit alu2 (A[2], B[2], ALUControl, 0, carryOut[1], out[2], carryOut[2]);
	ALU1Bit alu3 (A[3], B[3], ALUControl, 0, carryOut[2], out[3], carryOut[3]);
	ALU1Bit alu4 (A[4], B[4], ALUControl, 0, carryOut[3], out[4], carryOut[4]);
	ALU1Bit alu5 (A[5], B[5], ALUControl, 0, carryOut[4], out[5], carryOut[5]);
	ALU1Bit alu6 (A[6], B[6], ALUControl, 0, carryOut[5], out[6], carryOut[6]);
	ALU1Bit alu7 (A[7], B[7], ALUControl, 0, carryOut[6], out[7], carryOut[7]);
	ALU1Bit alu8 (A[8], B[8], ALUControl, 0, carryOut[7], out[8], carryOut[8]);
	ALU1Bit alu9 (A[9], B[9], ALUControl, 0, carryOut[8], out[9], carryOut[9]);
	ALU1Bit alu10 (A[10], B[10], ALUControl, 0, carryOut[9], out[10], carryOut[10]);
	ALU1Bit alu11 (A[11], B[11], ALUControl, 0, carryOut[10], out[11], carryOut[11]);
	ALU1Bit alu12 (A[12], B[12], ALUControl, 0, carryOut[11], out[12], carryOut[12]);
	ALU1Bit alu13 (A[13], B[13], ALUControl, 0, carryOut[12], out[13], carryOut[13]);
	ALU1Bit alu14 (A[14], B[14], ALUControl, 0, carryOut[13], out[14], carryOut[14]);
	ALU1Bit alu15 (A[15], B[15], ALUControl, 0, carryOut[14], out[15], carryOut[15]);
	ALU1Bit alu16 (A[16], B[16], ALUControl, 0, carryOut[15], out[16], carryOut[16]);
	ALU1Bit alu17 (A[17], B[17], ALUControl, 0, carryOut[16], out[17], carryOut[17]);
	ALU1Bit alu18 (A[18], B[18], ALUControl, 0, carryOut[17], out[18], carryOut[18]);
	ALU1Bit alu19 (A[19], B[19], ALUControl, 0, carryOut[18], out[19], carryOut[19]);
	ALU1Bit alu20 (A[20], B[20], ALUControl, 0, carryOut[19], out[20], carryOut[20]);
	ALU1Bit alu21 (A[21], B[21], ALUControl, 0, carryOut[20], out[21], carryOut[21]);
	ALU1Bit alu22 (A[22], B[22], ALUControl, 0, carryOut[21], out[22], carryOut[22]);
	ALU1Bit alu23 (A[23], B[23], ALUControl, 0, carryOut[22], out[23], carryOut[23]);
	ALU1Bit alu24 (A[24], B[24], ALUControl, 0, carryOut[23], out[24], carryOut[24]);
	ALU1Bit alu25 (A[25], B[25], ALUControl, 0, carryOut[24], out[25], carryOut[25]);
	ALU1Bit alu26 (A[26], B[26], ALUControl, 0, carryOut[25], out[26], carryOut[26]);
	ALU1Bit alu27 (A[27], B[27], ALUControl, 0, carryOut[26], out[27], carryOut[27]);
	ALU1Bit alu28 (A[28], B[28], ALUControl, 0, carryOut[27], out[28], carryOut[28]);
	ALU1Bit alu29 (A[29], B[29], ALUControl, 0, carryOut[28], out[29], carryOut[29]);
	ALU1Bit alu30 (A[30], B[30], ALUControl, 0, carryOut[29], out[30], carryOut[30]);
	ALU1BitMSB alu31 (A[31], B[31], ALUControl, 0, carryOut[30], out[31], carryOut[31],setLess);
endmodule

module ALU1Bit(A, B, Op, less, carryIn, out, carryOut);
	//input and output ports
	input A, B, carryIn, less;
	input [2:0] Op;
	output out, carryOut;
	//inputs for the main mux and output of the mux that decides the final b value
	wire muxIn0, muxIn1, muxIn3;
	
	//decide whether the final B value is b or its negation depending on the bneg bit from O;
	wire negatedB, bFinal;
	assign negatedB = ~B;
	mux21 bInvert(B, negatedB, bFinal, Op[2]);

	// send the outputs of the 1 bit and and or operations to the mux inputs
	and (muxIn0, A, bFinal);
	or (muxIn1, A, bFinal);
	
	//perform the addition or subtraction operation
	adder add1 (A, B, carryIn, muxIn3, carryOut);
	
	//determine the output
	wire tmp1, tmp2;
	mux21 mux1 (muxIn0, muxIn1, tmp1, Op[0]);
	mux21 mux2 (less, muxIn3, tmp2, Op[0]);
	mux21 mux3 (tmp1, tmp2, out, Op[1]);
endmodule
// same as the ALU1Bit module but it includes a set output for the slti instruction
module ALU1BitMSB(A, B, Op, less, carryIn, out, carryOut, set);
	//input and output ports
	input A, B, carryIn, less;
	input [2:0] Op;
	output out, carryOut, set;
	//inputs for the main mux and output of the mux that decides the final b value
	wire muxIn0, muxIn1, muxIn3, bFinal;
	
	//decide whether the final B value is b or its negation depending on the bneg bit;
	wire negatedB;
	assign negatedB = ~B;
	mux21 bValue(B, negatedB, bFinal, Op[2]);

	// send the outputs of the 1 bit and and or operations to the mux inputs
	and (muxIn0, A, bFinal);
	or (muxIn1, A, bFinal);
	
	//perform the addition or subtraction operation
	adder add1 (A, B, carryIn, muxIn3, carryOut);
	assign set = muxIn3;
	
	//determine the output
	wire tmp1, tmp2;
	mux21 mux1 (muxIn0, muxIn1, tmp1, Op[0]);
	mux21 mux2 (less, muxIn3, tmp2, Op[0]);
	mux21 mux3 (tmp1, tmp2, out, Op[1]);
endmodule

module mux21(a, b, out, select);
	input a,b, select;
	output out;
	
	//select = 0, out = a
	//select = 1, out = b

	assign out = (a&(~select))|(b&(select));
endmodule

module adder (A, B, carryIn, sum, carryOut);
	input A, B, carryIn;
	output sum, carryOut;
	
	//generate sum
	wire tmp;
	xor(tmp, A, B);
	xor(sum,tmp,carryIn);
	
	//generate carryOut
	assign carryOut = (carryIn&(A^B))|(A&B);
endmodule
