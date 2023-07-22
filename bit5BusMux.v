`timescale 1 ps / 100 fs
module bit5BusMux (A, B, out, select);
    input [4:0] A, B;
    input select;
    output [4:0] out;

	mux21 mux4(A[4], B[4], out[4], select);
	mux21 mux3(A[3], B[3], out[3], select);
	mux21 mux2(A[2], B[2], out[2], select);
	mux21 mux1(A[1], B[1], out[1], select);
	mux21 mux0(A[0], B[0], out[0], select);
endmodule