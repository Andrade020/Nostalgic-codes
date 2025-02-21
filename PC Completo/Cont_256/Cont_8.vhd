library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Cont_8 is						-- contador de ate 255
	Port (rst, clk, en, ld, clr: in std_logic;
			load: in unsigned (7 downto 0);
		   Q: out unsigned (7 downto 0));
end entity;

architecture X of Cont_8 is
	signal Q_tmp: unsigned (7 downto 0);
		begin
			process (rst, clk)
				begin
					if rst = '1' then-- and rst'event 
					Q_tmp <= "00000000";
					elsif clk'event and clk = '1' then
						if clr = '1' then
						Q_tmp <= "00000000";
						else
							if en = '1' then
								if ld = '1' then
								Q_tmp <= load;
								else
							Q_tmp <= Q_tmp + 1;
						end if;
					end if;
				end if;
			end if;
		end process;
	Q <= Q_tmp;
end architecture;
		