library verilog;
use verilog.vl_types.all;
entity Proc_Simples_vlg_check_tst is
    port(
        PC_Rom1         : in     vl_logic_vector(7 downto 0);
        Rom_UC1         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Proc_Simples_vlg_check_tst;
