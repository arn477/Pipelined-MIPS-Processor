module DataMem(address, writeData, readData, memWrite, memRead, clk);
input [31:0] address, writeData;
input memWrite, memRead, clk;
output [31:0] readData;
reg [31:0] readData;
reg[7:0] ram[255:0];

always @ (posedge clk)
	begin
	if (memWrite)
		begin
		ram[address] = writeData[31:24];
		ram[address+1] = writeData[23:16];
		ram[address+2] = writeData[15:8];
		ram[address+3] = writeData[7:0];
		end
	if (memRead)
		begin
		readData = {ram[address],ram[address+1], ram[address+2], ram[address+3]};
		end
	end
endmodule