library verilog;
use verilog.vl_types.all;
entity control_vlg_sample_tst is
    port(
        opCode          : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end control_vlg_sample_tst;
