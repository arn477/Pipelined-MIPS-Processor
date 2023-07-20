module stallControlUnit (idExMemRead, idExRt, ifIdRs, ifIdRt, ifWrite, pcWrite, resetIdControl);
input idExMemRead;
input [31:0] idExRt, ifIdRs, ifIdRt;
reg ifWrite, pcWrite, resetIdControl;
output ifWrite, pcWrite, resetIdControl;

always @(*)
	begin
	ifWrite = 1'b1;
	pcWrite = 1'b1;
	resetIdControl = 1'b0;
	
	if (idExMemRead && ((idExRt == ifIdRs) || (idExRt == ifIdRt)))
		begin
		ifWrite = 1'b0;
		pcWrite = 1'b0;
		resetIdControl = 1'b1;
		end
	end
	

endmodule
