`timescale 1 ps / 100 fs
module wbForwardingUnit(readData1, readData2, writeData, regWrite, writeReg, rs, rt, readData1Out, readData2Out);
    input [31:0] readData1, readData2, writeData;
    input [4:0] writeReg, rs, rt;
    input regWrite;
    output [31:0] readData1Out, readData2Out;
    reg[31:0] readData1Out, readData2Out;
    
    always @(*)
    begin
        if (regWrite && (writeReg != 0) && (writeReg == rs))
            readData1Out = writeData;
        else
            readData1Out = readData1;

        if (regWrite && (writeReg != 0) && (writeReg == rt))
            readData2Out = writeData;
        else
            readData2Out = readData2;
    end
endmodule