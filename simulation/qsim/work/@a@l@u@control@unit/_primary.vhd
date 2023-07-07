library verilog;
use verilog.vl_types.all;
entity ALUControlUnit is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        ALUControl      : out    vl_logic_vector(2 downto 0)
    );
end ALUControlUnit;
