`timescale 1 ps / 100 fs
module stallControlUnit (idExMemRead, idExRt, ifIdRs, ifIdRt, ifWrite, pcWrite, resetIdControl);
input idExMemRead;
input [4:0] idExRt, ifIdRs, ifIdRt;
output ifWrite, pcWrite, resetIdControl;
reg ifWrite, pcWrite, resetIdControl;

always @(*)
	begin
	ifWrite = 1'b1;
	pcWrite = 1'b1;
	resetIdControl = 1'b0;
	
	if (idExMemRead && ((idExRt == ifIdRs) || (idExRt == ifIdRt)))
		ifWrite = 1'b0;
		pcWrite = 1'b0;
		resetIdControl = 1'b1;
	end

endmodule
