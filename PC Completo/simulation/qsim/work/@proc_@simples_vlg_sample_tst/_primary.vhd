library verilog;
use verilog.vl_types.all;
entity Proc_Simples_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        enta            : in     vl_logic_vector(7 downto 0);
        entb            : in     vl_logic_vector(7 downto 0);
        op_ula          : in     vl_logic_vector(2 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Proc_Simples_vlg_sample_tst;
