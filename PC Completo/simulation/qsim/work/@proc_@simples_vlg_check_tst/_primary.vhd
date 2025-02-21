library verilog;
use verilog.vl_types.all;
entity Proc_Simples_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        enta1           : in     vl_logic_vector(7 downto 0);
        entb1           : in     vl_logic_vector(7 downto 0);
        R_ui            : in     vl_logic_vector(7 downto 0);
        sais            : in     vl_logic_vector(7 downto 0);
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Proc_Simples_vlg_check_tst;
