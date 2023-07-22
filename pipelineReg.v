// 32 bit register to be used for pipelining
module pipelineReg(regOut, regIn, regEn, rst, clk);
	input [31:0] regIn;
	input regEn, rst, clk;
	output [31:0] regOut;
	
	reg1bit reg31 (regIn[31], regOut[31], regEn, rst, clk);
	reg1bit reg30 (regIn[30], regOut[30], regEn, rst, clk);
	reg1bit reg29 (regIn[29], regOut[29], regEn, rst, clk);
	reg1bit reg28 (regIn[28], regOut[28], regEn, rst, clk);
	reg1bit reg27 (regIn[27], regOut[27], regEn, rst, clk);
	reg1bit reg26 (regIn[26], regOut[26], regEn, rst, clk);
	reg1bit reg25 (regIn[25], regOut[25], regEn, rst, clk);
	reg1bit reg24 (regIn[24], regOut[24], regEn, rst, clk);
	reg1bit reg23 (regIn[23], regOut[23], regEn, rst, clk);
	reg1bit reg22 (regIn[22], regOut[22], regEn, rst, clk);
	reg1bit reg21 (regIn[21], regOut[21], regEn, rst, clk);
	reg1bit reg20 (regIn[20], regOut[20], regEn, rst, clk);
	reg1bit reg19 (regIn[19], regOut[19], regEn, rst, clk);
	reg1bit reg18 (regIn[18], regOut[18], regEn, rst, clk);
	reg1bit reg17 (regIn[17], regOut[17], regEn, rst, clk);
	reg1bit reg16 (regIn[16], regOut[16], regEn, rst, clk);
	reg1bit reg15 (regIn[15], regOut[15], regEn, rst, clk);
	reg1bit reg14 (regIn[14], regOut[14], regEn, rst, clk);
	reg1bit reg13 (regIn[13], regOut[13], regEn, rst, clk);
	reg1bit reg12 (regIn[12], regOut[12], regEn, rst, clk);
	reg1bit reg11 (regIn[11], regOut[11], regEn, rst, clk);
	reg1bit reg10 (regIn[10], regOut[10], regEn, rst, clk);
	reg1bit reg9 (regIn[9], regOut[9], regEn, rst, clk);
	reg1bit reg8 (regIn[8], regOut[8], regEn, rst, clk);
	reg1bit reg7 (regIn[7], regOut[7], regEn, rst, clk);
	reg1bit reg6 (regIn[6], regOut[6], regEn, rst, clk);
	reg1bit reg5 (regIn[5], regOut[5], regEn, rst, clk);
	reg1bit reg4 (regIn[4], regOut[4], regEn, rst, clk);
	reg1bit reg3 (regIn[3], regOut[3], regEn, rst, clk);
	reg1bit reg2 (regIn[2], regOut[2], regEn, rst, clk);
	reg1bit reg1 (regIn[1], regOut[1], regEn, rst, clk);
	reg1bit reg0 (regIn[0], regOut[0], regEn, rst, clk);
	
endmodule

// d flip flop
module dFlipFlop(d,q,rst,clk);
	input d, rst, clk;
	output q;
	reg q;
	
	always @(posedge clk or posedge rst)
		begin
		if (rst)
			q = 0;
		else
			q = d;
		end
endmodule

// 1 bit register with enable and reset
module reg1bit(in, out, enable, rst, clk);
	input in, enable, rst, clk;
	output out;
	wire w1, w2, d;
	
	and and1(w1, in, enable);
	and and2(w2, out, ~enable);
	or or1(d, w1, w2);
	dFlipFlop d1(d,out,rst, clk);
endmodule

module reg5bit (in, out, enable, rst, clk);
	input [4:0] in;
	input enable, rst, clk;
	output [4:0] out;

	reg1bit reg5 (in[4], out[4], enable, rst, clk);
	reg1bit reg4 (in[3], out[3], enable, rst, clk);
	reg1bit reg3 (in[2], out[2], enable, rst, clk);
	reg1bit reg2 (in[1], out[1], enable, rst, clk);
	reg1bit reg1 (in[0], out[0], enable, rst, clk);
endmodule