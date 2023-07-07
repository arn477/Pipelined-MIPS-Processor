library verilog;
use verilog.vl_types.all;
entity ALUControlUnit_vlg_check_tst is
    port(
        ALUControl      : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALUControlUnit_vlg_check_tst;
