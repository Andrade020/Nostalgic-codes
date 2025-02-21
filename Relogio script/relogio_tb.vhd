Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity relogio_tb is
end entity;

architecture x of relogio_tb is
	signal RST1, CLK1, EN1, CLR1, LD1 : std_logic;
	signal LOAD1, Q1hd, Q1hu, Q1md, Q1mu, Q1sd, Q1su : unsigned (3 downto 0);
	
	component relogio is
	port(CLK, EN, RST, CLR, LD: in std_logic;
		 LOAD                         : in unsigned (3 downto 0);
		 Qsu, Qsd, Qmu, Qmd, Qhu, Qhd : out unsigned(3 downto 0));
	end component;
	
	begin
		cont_test : relogio
			port map(RST  => RST1,
			         CLK  => CLK1,
					 EN   => EN1,
					 CLR  => CLR1,
					 LD   => LD1,
					 LOAD => LOAD1,
					 Qsu  => Q1su,
					 Qsd  => Q1sd,
					 Qmu  => Q1mu,
					 Qmd  => Q1md,
					 Qhu  => Q1hu,
					 Qhd  => Q1hd);
	   process
   begin
      RST1 <= '1';
      wait for 12 ns;
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
      EN1 <= '1';
      wait;
	end process;
	
	CLR1 <= '0';
	
	process
	begin
		LD1 <= '0';
		wait;
	end process;
	
	process
	begin
		LOAD1 <= "0000";
		wait;
	end process;

end architecture;