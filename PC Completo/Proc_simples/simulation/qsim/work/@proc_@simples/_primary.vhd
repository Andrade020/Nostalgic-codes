library verilog;
use verilog.vl_types.all;
entity Proc_Simples is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        PC_Rom1         : out    vl_logic_vector(7 downto 0);
        Rom_UC1         : out    vl_logic_vector(7 downto 0)
    );
end Proc_Simples;
