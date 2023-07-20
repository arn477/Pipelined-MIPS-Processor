module busMux31(A, B, C, out, select);
	input [31:0] A, B, C;
	input [1:0] select;
	output [31:0] out;
	wire[31:0] w1, w2;
	// if select = 00 choose A
	// if select = 01 choose B
	// if select = 10 choose C
	busMux21 mux1 (A, B, w1, select[0]);
	busMux21 mux2 (C, A, w2, select[0]);
	busMux21 mux3 (w1, w2, out, select[1]);
endmodule
	