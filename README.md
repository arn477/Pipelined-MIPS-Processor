# Pipelined MIPS Processor
 
This verilog code describes a 64 bit MIPS processor that supports Load Word, Store Word, Add, Addi, Beq, And, Or, and Slti. The main goal of this project was to create a processor that is able to execute these instructions in a pipeline. The loading, storing and branch instructions can cause hazards so I also implemented modules to address these. 

**This is an example of a sequence of instructions this CPU could execute:**
<img width="517" alt="image" src="https://github.com/arn477/Pipelined-MIPS-Processor/assets/75505943/0f6f03c6-dd8f-4fb5-be3b-b310eb83b817">
