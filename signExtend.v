module signExtend(in, out);
	input [15:0] in;
	output [31:0] out;
	
	//replicate the sign bit 16 times, the rest of the number is composed of the input number
	assign out = {{16{in[15]}},in};
endmodule
	