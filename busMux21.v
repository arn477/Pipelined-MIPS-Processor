`timescale 1 ps / 100 fs
module busMux21(A, B, out, select);
	input [31:0] A, B;
	input select;
	output [31:0] out;
	
	mux21 mux31(A[31], B[31], out[31], select);
	mux21 mux30(A[30], B[30], out[30], select);
	mux21 mux29(A[29], B[29], out[29], select);
	mux21 mux28(A[28], B[28], out[28], select);
	mux21 mux27(A[27], B[27], out[27], select);
	mux21 mux26(A[26], B[26], out[26], select);
	mux21 mux25(A[25], B[25], out[25], select);
	mux21 mux24(A[24], B[24], out[24], select);
	mux21 mux23(A[23], B[23], out[23], select);
	mux21 mux22(A[22], B[22], out[22], select);
	mux21 mux21(A[21], B[21], out[21], select);
	mux21 mux20(A[20], B[20], out[20], select);
	mux21 mux19(A[19], B[19], out[19], select);
	mux21 mux18(A[18], B[18], out[18], select);
	mux21 mux17(A[17], B[17], out[17], select);
	mux21 mux16(A[16], B[16], out[16], select);
	mux21 mux15(A[15], B[15], out[15], select);
	mux21 mux14(A[14], B[14], out[14], select);
	mux21 mux13(A[13], B[13], out[13], select);
	mux21 mux12(A[12], B[12], out[12], select);
	mux21 mux11(A[11], B[11], out[11], select);
	mux21 mux10(A[10], B[10], out[10], select);
	mux21 mux9(A[9], B[9], out[9], select);
	mux21 mux8(A[8], B[8], out[8], select);
	mux21 mux7(A[7], B[7], out[7], select);
	mux21 mux6(A[6], B[6], out[6], select);
	mux21 mux5(A[5], B[5], out[5], select);
	mux21 mux4(A[4], B[4], out[4], select);
	mux21 mux3(A[3], B[3], out[3], select);
	mux21 mux2(A[2], B[2], out[2], select);
	mux21 mux1(A[1], B[1], out[1], select);
	mux21 mux0(A[0], B[0], out[0], select);

endmodule
