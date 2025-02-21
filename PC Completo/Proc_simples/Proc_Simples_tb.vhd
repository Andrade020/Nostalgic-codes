library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Proc_Simples_tb is
end entity;
architecture Y of Proc_Simples_tb is
	signal rst1, clk1: std_logic;
	signal R_ui: unsigned(7 downto 0);
Component Proc_Simples is
	Port (rst, clk: in std_logic);
end component;
begin
	comp_test: Proc_Simples
		Port map (rst => rst1,
					 clk => clk1
					 );
	Process
begin
      rst1 <= '1'; 						--pulso inicial de reset 
      wait for 10 ns;
		rst1 <= '0';
		wait;
	end process;	   
	process
   begin
      clk1 <= '0';						-- oscilacao do clock
      wait for 0.5 ns;
      clk1 <= '1';
      wait for 0.5 ns;
	end process;
end architecture;