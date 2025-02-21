library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
	Port (rst, clk, en, ld, clr: in std_logic;
		  load: in unsigned (7 downto 0);
		  Q: out unsigned (7 downto 0));
end entity;

architecture X of PC is  ---       					 Contador de Programa 
	
Component Cont_8 is
	Port (rst, clk, en, ld, clr: in std_logic;
			load: in unsigned (7 downto 0);
			Q: out unsigned (7 downto 0));
end component;

begin
	CPU: Cont_8
		Port map (rst => rst,
					 clk => clk,
					 en => en,
					 clr => '0',
					 ld => ld,
					 load => load,
					 Q => Q);
					 	
end architecture;
