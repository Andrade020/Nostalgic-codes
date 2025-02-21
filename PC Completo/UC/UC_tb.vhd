library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UC_tb is
end entity;

architecture X of UC_tb is
	signal ld1: std_logic;
	signal Data_In1, load1: unsigned (7 downto 0);
	
Component UC is
	Port (ld: out std_logic;
			Data_In: in unsigned (7 downto 0);
			load: out unsigned (7 downto 0));
end component;

begin
	comp_test: UC
		Port map (Data_In => Data_In1,
					 ld => ld1,
					 load => load1);
					 
	Process
begin
      Data_In1 <= x"00";
		wait for 10 ns;
		Data_In1 <= x"03";
		wait for 10 ns;
		Data_In1 <= x"04";
		wait for 10 ns;
		Data_In1 <= x"05";
		wait for 10 ns;
	end process;
end architecture;