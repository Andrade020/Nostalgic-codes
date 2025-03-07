library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Cont_8_tb is
end entity;

architecture X of Cont_8_tb is
	signal rst1, clk1, en1, ld1, clr1: std_logic;
	signal load1, Q1: unsigned (7 downto 0);
	
Component Cont_8 is
	Port (rst, clk, en, ld, clr: in std_logic;
			load: in unsigned (7 downto 0);
			Q: out unsigned (7 downto 0));
end component;

begin
	comp_test: Cont_8
		Port map (rst => rst1,
					 clk => clk1,
					 en => en1,
					 ld => ld1,
					 clr => clr1,
					 load => load1,
					 Q => Q1);
					 
	Process
begin
      RST1 <= '1';
      wait for 13 ns;
      RST1 <= '0';
      wait for 66 ns;
		RST1 <= '1';
		wait for 4 ns;
		RST1 <= '0';
		wait;
	end process;
	   
	process
   begin
      CLK1 <= '0';
      wait for 10 ns;
      CLK1 <= '1';
      wait for 10 ns;
	end process;
	   
	process
   begin
      EN1 <= '0';
      wait for 45 ns;
      EN1 <= '1';
      wait for 20 ns;
		EN1 <= '0';
		wait for 40 ns;
		EN1 <= '1';
		wait;
	end process;
	
	process
   begin
      CLR1 <= '0';
      wait for 115 ns;
      CLR1 <= '0';
      wait for 20 ns;
		CLR1 <= '0';
		wait;
	end process;
	   
	process
   begin
      LD1 <= '0';
      wait for 165 ns;
      LD1 <= '1';
      wait for 10 ns;
		LD1 <= '0';
		wait;
	end process;
	
	process
   begin
      LOAD1 <= "00000000";
      wait for 140 ns;
      LOAD1 <= "01000100";
      wait;
	end process;
end architecture;					