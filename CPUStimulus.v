`timescale 1 ps / 100 fs
module CPUStimulus();
parameter ClockDelay = 10000;
reg clk,reset;


CPU  myCPU(clk, reset);
initial clk = 0;
always #(ClockDelay/2) clk = ~clk;

initial 
begin
   reset = 1;
  #(ClockDelay/4);
  reset = 0;
end
endmodule