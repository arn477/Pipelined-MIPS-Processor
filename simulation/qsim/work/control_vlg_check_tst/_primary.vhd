library verilog;
use verilog.vl_types.all;
entity control_vlg_check_tst is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUSrc          : in     vl_logic;
        Branch          : in     vl_logic;
        Jump            : in     vl_logic;
        MemRead         : in     vl_logic;
        MemToReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end control_vlg_check_tst;
