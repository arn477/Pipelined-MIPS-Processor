`timescale 1 ps / 100 fs
module adder32Bit(A,B,sum);
	input[31:0] A, B;
	output[31:0] sum;
	wire [31:0] carryOut;
	
	//adder does not need to be defined here because it was already done in the ALU.v file
	adder add0 (A[0], B[0], 0, sum[0], carryOut[0]);
	adder add1 (A[1], B[1], carryOut[0], sum[1], carryOut[1]);
	adder add2 (A[2], B[2], carryOut[1], sum[2], carryOut[2]);
	adder add3 (A[3], B[3], carryOut[2], sum[3], carryOut[3]);
	adder add4 (A[4], B[4], carryOut[3], sum[4], carryOut[4]);
	adder add5 (A[5], B[5], carryOut[4], sum[5], carryOut[5]);
	adder add6 (A[6], B[6], carryOut[5], sum[6], carryOut[6]);
	adder add7 (A[7], B[7], carryOut[6], sum[7], carryOut[7]);
	adder add8 (A[8], B[8], carryOut[7], sum[8], carryOut[8]);
	adder add9 (A[9], B[9], carryOut[8], sum[9], carryOut[9]);
	adder add10 (A[10], B[10], carryOut[9], sum[10], carryOut[10]);
	adder add11 (A[11], B[11], carryOut[10], sum[11], carryOut[11]);
	adder add12 (A[12], B[12], carryOut[11], sum[12], carryOut[12]);
	adder add13 (A[13], B[13], carryOut[12], sum[13], carryOut[13]);
	adder add14 (A[14], B[14], carryOut[13], sum[14], carryOut[14]);
	adder add15 (A[15], B[15], carryOut[14], sum[15], carryOut[15]);
	adder add16 (A[16], B[16], carryOut[15], sum[16], carryOut[16]);
	adder add17 (A[17], B[17], carryOut[16], sum[17], carryOut[17]);
	adder add18 (A[18], B[18], carryOut[17], sum[18], carryOut[18]);
	adder add19 (A[19], B[19], carryOut[18], sum[19], carryOut[19]);
	adder add20 (A[20], B[20], carryOut[19], sum[20], carryOut[20]);
	adder add21 (A[21], B[21], carryOut[20], sum[21], carryOut[21]);
	adder add22 (A[22], B[22], carryOut[21], sum[22], carryOut[22]);
	adder add23 (A[23], B[23], carryOut[22], sum[23], carryOut[23]);
	adder add24 (A[24], B[24], carryOut[23], sum[24], carryOut[24]);
	adder add25 (A[25], B[25], carryOut[24], sum[25], carryOut[25]);
	adder add26 (A[26], B[26], carryOut[25], sum[26], carryOut[26]);
	adder add27 (A[27], B[27], carryOut[26], sum[27], carryOut[27]);
	adder add28 (A[28], B[28], carryOut[27], sum[28], carryOut[28]);
	adder add29 (A[29], B[29], carryOut[28], sum[29], carryOut[29]);
	adder add30 (A[30], B[30], carryOut[29], sum[30], carryOut[30]);
	adder add31 (A[31], B[31], carryOut[30], sum[31], carryOut[31]);
endmodule
