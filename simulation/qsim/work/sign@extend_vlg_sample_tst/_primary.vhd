library verilog;
use verilog.vl_types.all;
entity signExtend_vlg_sample_tst is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end signExtend_vlg_sample_tst;
