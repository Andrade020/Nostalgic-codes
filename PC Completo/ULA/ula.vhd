library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ula is
port (  en_a, en_b: in std_logic;
		  a: in unsigned (7 downto 0); --vai, entrada
        b: in unsigned (7 downto 0); --vai, entrada
        s: out unsigned (7 downto 0); --vai tambem, saida
        sel_ula: in unsigned (2 downto 0); -- esse vai 
        carry: out std_logic;
        zero: out std_logic);
end entity;

architecture u of ula is
signal a1 : unsigned (8 downto 0);
signal b1: unsigned (8 downto 0);
signal s1: unsigned (8 downto 0);--

--signal sel_ula1: unsigned (2 downto 0);

--a1(0)<= a(0);
--a1(1)<= a(1);
--a1(2)<= a(2);
--a1(3)<= a(0);
--a1(0)<= a(0);
--a1(0)<= a(0);
--a1(0)<= a(0);
--a1(0)<= a(0);
begin
process (en_a, en_b,a1, b1, a, b ) 
begin
		if (en_a = '1') then
			a1(8)<='0';
			a1(7)<= a(7);
			a1(6)<= a(6);
			a1(5)<= a(5);
			a1(4)<= a(4);
			a1(3)<= a(3);
			a1(2)<= a(2);
			a1(1)<= a(1);
			a1(0)<= a(0);
	end if;
		if (en_b = '1') then
			b1(8)<='0';
			b1(7)<= b(7);
			b1(6)<= b(6);
			b1(5)<= b(5);
			b1(4)<= b(4);
			b1(3)<= b(3);
			b1(2)<= b(2);
			b1(1)<= b(1);
			b1(0)<= b(0);

		end if;	
	end process;



process(a1, b1, sel_ula,s1) --1
begin   
    case sel_ula is   --1
        when "000"=> --add
            s1<=a1+b1;
        when "001" => --sub
            s1<=a1-b1;
		  when "010"=> --and   
            s1<= a1 and b1;
	     when "011"=> --or
            s1<=a1 or b1;
		  when "100" => --xor
            s1<= a1 xor b1;
	     when "101"=> --not
            s1<= not a1;
        when "110" => --cmp
            s1<=a1-b1;
        when "111" => --bypass
            s1<=a1;
        
       
        
       
        when others=> --"010" ou "011"
            s1<="000000000";
    end case;
end process;
 
			s(0) <= s1(0);
			s(1) <= s1(1);
			s(2) <= s1(2);
			s(3) <= s1(3);
			s(4) <= s1(4);
			s(5) <= s1(5);
			s(6) <= s1(6);
			s(7) <= s1(7);
 -- downto 0);
--carry <= s1(8);
 --sel_ula1 <= sel_ula;


process (s1)--
begin--
    case s1(8) is--
        when '1' =>--
        carry <= '1';--
        when others =>--
        carry <= '0';--
    end case;--
end process;--
process (s1)
begin   
    case s1 is   --
        when "000000000" =>
        zero <= '1';
        when others =>
        zero <= '0';
    end case;   
end process;
end architecture;       
