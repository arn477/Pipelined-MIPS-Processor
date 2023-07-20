module forwardingUnit(exMemRegWrite, exMemRd, memWbRegWrite, memWbRd, idExRs, idExRt, forwardA, forwardB);
input exMemRegWrite, memWbRegWrite;
input [31:0] exMemRd, memWbRd, idExRs, idExRt;
output [1:0] forwardA, forwardB;
reg [1:0] forwardA, forwardB;

always @(*)
begin 
	forwardA = 2'b00;
	forwardB = 2'b00;
	if (exMemRegWrite && (exMemRd != 0) && (exMemRd == idExRs))
		forwardA = 2'b10;
		
	if (exMemRegWrite && (exMemRd != 0) && (exMemRd == idExRt))
		forwardB = 2'b10;

	if (memWbRegWrite && (memWbRd != 0) && (~(exMemRegWrite && (exMemRd != 0) && (exMemRd == idExRs))) && (memWbRd == idExRs))
		forwardA = 2'b01;

	if (memWbRegWrite && (memWbRd != 0) && (~(exMemRegWrite & (exMemRd != 0) && (exMemRd == idExRt))) && (memWbRd == idExRt))
		forwardB = 2'b01;
end

endmodule
