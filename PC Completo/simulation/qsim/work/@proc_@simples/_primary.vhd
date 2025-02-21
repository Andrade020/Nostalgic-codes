library verilog;
use verilog.vl_types.all;
entity Proc_Simples is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        R_ui            : out    vl_logic_vector(7 downto 0);
        enta            : in     vl_logic_vector(7 downto 0);
        entb            : in     vl_logic_vector(7 downto 0);
        enta1           : out    vl_logic_vector(7 downto 0);
        entb1           : out    vl_logic_vector(7 downto 0);
        sais            : out    vl_logic_vector(7 downto 0);
        op_ula          : in     vl_logic_vector(2 downto 0);
        carry           : out    vl_logic;
        zero            : out    vl_logic
    );
end Proc_Simples;
