library verilog;
use verilog.vl_types.all;
entity shiftLeft2_vlg_check_tst is
    port(
        \out\           : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end shiftLeft2_vlg_check_tst;
