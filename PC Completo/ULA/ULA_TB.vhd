Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
Entity ULA_TB is
     end entity;
Architecture aliandra of ULA_TB is
    component ULA is
    port (en_a, en_b: in std_logic;
    sel_ula: in unsigned (2 downto 0);
	a, b: in unsigned (7 downto 0);
	s: out unsigned (7 downto 0);--
	carry, zero: out std_logic);
   end component ;
   signal cys, zs, en_a1, en_b1: std_logic;
   signal ent0s, ent1s, saidax: unsigned (7 downto 0);
    signal sels: unsigned (2 downto 0);
   begin
      DUT: ULA
      port map (a => ent0s,
                b => ent1s,
                s => saidax,
					 carry=> cys,
                zero=> zs,
                sel_ula=>sels, 
                en_a => en_a1, 
                en_b=>en_b1);

      process
               begin 
                en_b1<= '0';
                 wait for 10 ns; 
                 en_b1<='1';
                 wait for 100 ns;                
        end process;
		  process
               begin 
                en_a1<= '0';
                 wait for 10 ns; 
                  en_a1<= '1'; 
                  wait for 100 ns;                
        end process;

         process
               begin 
                 ent0s<= "00000011";
                 wait;                 
                 end process;
					  
         process
               begin 
                 ent1s<= "00000011";
                 wait;                 
        end process;
		  
         process
                 begin 
                 sels <= "000";
              --   wait for 20 ns ;
            --   SEL <= "10";
            --   wait for 20 ns;
            --   SEL <= "11";
                -- wait for 42 ns;
                -- SEL <= "01";
                -- wait for 40 ns;
                -- SEL <= "01";
                 wait ;--for 30 ns;
                 end process;
end Architecture;


