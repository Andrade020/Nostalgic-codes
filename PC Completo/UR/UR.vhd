library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UR is
  port ( UR_clk      : in std_logic;
         UR_selecao  : in  unsigned(1 downto 0);
         UR_datain   : in  unsigned(7 downto 0);
         UR_dataout  : out unsigned(7 downto 0);
			UR_we       : in  std_logic);
end entity UR;

architecture behavioral of UR is
   type REG_t is array (0 to 3) of unsigned(7 downto 0);
	signal REG : REG_t; 
begin
	process(UR_clk)
	begin
		if(UR_clk'event and UR_clk = '1') then
			if(UR_we = '1') then 
				REG(to_integer(UR_selecao))<= UR_datain; -- "00"-> 0 "01"-> 1 ...
			end if;
		end if;	
	end process;
	UR_dataout <= REG(to_integer(UR_selecao));
end architecture behavioral;
