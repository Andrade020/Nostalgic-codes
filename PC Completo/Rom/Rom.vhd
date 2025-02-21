library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is								-- Random operator memory 
  port ( address : in unsigned(6 downto 0);
         data    : out unsigned(7 downto 0) );
end entity ROM;

architecture behavioral of ROM is
  type mem is array ( 0 to 2**7 - 1) of unsigned(7 downto 0);
  constant my_Rom : mem := (
    0  => x"32", 
	 1  => x"00",
    2  => x"33",
    3  => x"01",
    4  => x"34",
    5  => x"06",
    6  => x"41",
    7  => x"92",
    8  => x"57",
    9  => x"06",
    10 => x"55",
    11 => x"0A",
    others => x"00");	
	 
	 begin
    process (address)
    begin
     case address is
       when "0000000" => data <= my_rom(0);
       when "0000001" => data <= my_rom(1);
       when "0000010" => data <= my_rom(2);
       when "0000011" => data <= my_rom(3);
       when "0000100" => data <= my_rom(4);
       when "0000101" => data <= my_rom(5);
       when "0000110" => data <= my_rom(6);
       when "0000111" => data <= my_rom(7);
       when "0001000" => data <= my_rom(8);
       when "0001001" => data <= my_rom(9);
       when "0001010" => data <= my_rom(10);
       when "0001011" => data <= my_rom(11);
   
       when others => data <= "00000000";
	 end case;
  end process;
	
	
	
end architecture behavioral;