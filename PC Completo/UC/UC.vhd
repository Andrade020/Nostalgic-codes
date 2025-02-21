library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UC is             -- liquid UC!!
	port (
		rst, clk: in std_logic;
		data_rom: in unsigned (0 to 7);							--ROM
		address: out unsigned (0 to 7) := x"00";
		rom_en: out std_logic := '1';
		
		in_reg: out unsigned (0 to 7) := x"00";	--UR
		out_reg: in unsigned (0 to 7);
		reg_sel: out unsigned (0 to 1) := "00";
		reg_we: out std_logic;-- := '0'; -- mudado 20:13- 9/7
		

		ula_operator: out unsigned(0 to 2) := "000";		--ULA
		ula_a, ula_b: out unsigned (0 to 7) := x"00";
		ula_en_a, ula_en_b: out std_logic := '0';
		ula_q: in unsigned (0 to 7);
		ula_z, ula_n: in std_logic;
		

		ld_pc, en_pc: out std_logic := '0';		--PC
		load_pc: out unsigned (0 to 7) := x"00";
		q_pc: in unsigned (0 to 7)
	);
end entity;

architecture behavioural of UC is
	signal estado, estado_novo: integer range 0 to 4;
	signal opcode: unsigned (0 to 7) := x"00";
	signal sel_address: std_logic := '0';
	signal en_ldr: std_logic := '0';
	signal ldr: unsigned (0 to 7) := x"00";
	
	begin
	
	ula_a <= out_reg;
	ula_b <= out_reg;

	ldr <= ldr when en_ldr = '0' else out_reg;    -- mais de 8 mil!

	address <= q_pc when sel_address = '0' else out_reg;
	
	process (rst, clk) begin
		if (rst = '1') then
			estado <= 0;
			
		elsif  (clk = '1' and clk'event) then
			estado <= estado_novo;
			if (estado = 1) then
				opcode <= data_rom;
			end if;
		end if;
	end process;
	
	process (estado, opcode, data_rom) begin
		case estado is
			when 0 =>	--Inicialização
				estado_novo <= 1;
				en_pc <= '0';
			when 1 =>	--Interpretação de opcodes
				case data_rom is

when x"00" =>					--sem operacao
						ld_pc <= '0';		--Sem salto
						en_pc <= '1';		--PC ativado
						reg_we <= '0';		--Sem escrita na UR
						estado_novo <= 1;
when x"03" =>					--B	x03
						load_pc <= x"03";	--Endereço para saltar
						ld_pc <= '1';		--Salte
						en_pc <= '1';		--PC ativado
						reg_we <= '0';
						estado_novo <= 1;
when x"04" =>                --B	x10
						load_pc <= x"10";
						ld_pc <= '1';
						en_pc <= '1';
						reg_we <= '0';
						estado_novo <= 1;
when x"05" =>					--B	0x00
						load_pc <= x"00";
						ld_pc	<= '1';
						en_pc <= '1';
						reg_we <= '0';
						estado_novo <= 1;					
	--B	IMM8 | BE	IMM8 | BNE	IMM8
			--LD	R0, IMM8 | LD	R1, IMM8 | LD	R2, IMM8 | LD	R3, IMM8
when x"55" | x"56" | x"57" | x"32" | x"33" | x"34" | x"35" =>
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_we <= '0';
						ld_pc <= '0';		--Sem salto ainda
						en_pc <= '1';		--PC ativado
						estado_novo <= 2;	--Leitura dos IMM8
			--LD Rx, [Ry]
when 	x"70"|x"71"|x"72"|x"73"|x"74"|x"75"|x"76"|x"77"|x"78"|x"79"|x"7A"|x"7B"|x"7C"|x"7D"|x"7E"|x"7F" =>
							
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_we <= '0';
						ld_pc <= '0';
						en_pc <= '0';
						estado_novo <= 2;						
			--LD Rx, Ry
when 	x"A0"|x"A1"|x"A2"|x"A3"|x"A4"|x"A5"|x"A6"|x"A7"|x"A8"|x"A9"|x"AA"|x"AB"|x"AC"|x"AD"|x"AE"|x"AF" =>
						reg_sel <= data_rom (6 to 7);--Seleciona Ry
						reg_we <= '0';
						ula_en_a <= '0';
						ula_en_b <= '0';
						en_ldr <= '1';--Seta o enable do registrador de load
						ld_pc <= '0';
						en_pc <= '0';
						estado_novo <= 2;
			--"ADD R0, R0 | ADD R0, R1 | ADD R0, R2 | ADD R0, R3"
when x"40" | x"41" | x"42" | x"43"=>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop A da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_operator <= "111";--Bypass  do MIGUEL
						ula_en_a <= '1';
						ula_en_b <= '0';
						estado_novo <= 2;
		--SUB R0, R0 | SUB R0, R1 | SUB R0, R2 | SUB R0, R3
when  x"90" | x"91" | x"92" | x"93"  =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop A da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_operator <= "001";--Subtração
						ula_en_a <= '1';
						ula_en_b <= '0';
						estado_novo <= 2;
		--AND R0, R0 | CMP R0, R1 | CMP R0, R2 | CMP R0, R3
when  x"50" | x"51" | x"52" | x"53" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop A da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_operator <= "010";-- E lógico
						ula_en_a <= '1';
						ula_en_b <= '0';
						estado_novo <= 2;
		--OR R0, R0 | CMP R0, R1 | CMP R0, R2 | CMP R0, R3
when  x"60" | x"61" | x"62" | x"63" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop A da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_operator <= "011";--Or lógico
						ula_en_a <= '1';
						ula_en_b <= '0';
						estado_novo <= 2;
		--CMP R0, R0 | CMP R0, R1 | CMP R0, R2 | CMP R0, R3
when  x"10" | x"11" | x"12" | x"13" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop A da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_operator <= "111";--Bypass do MIGUEL
						ula_en_a <= '1';
						ula_en_b <= '0';
						estado_novo <= 2;
when others =>	--pimba!
						report "pimba!";
						ld_pc <= '0';
						en_pc <= '0';
						reg_we <= '0';
						estado_novo <= 1;
				end case;		
			when 2 =>	--Leitura de IMM8
				case opcode is
					--B	IMM8
when x"55" =>
						load_pc <= data_rom;
						ld_pc <= '1';
						en_pc <= '1';
						estado_novo <= 1;
		--BE	IMM8
	when x"56" =>
						if (ula_z = '1') then
							load_pc <= data_rom;
							ld_pc <= '1';
							en_pc <= '1';
							estado_novo <= 1;
						else	--NOP
							ld_pc <= '0';		--Sem salto
							en_pc <= '1';		--PC ativado
							estado_novo <= 1;
						end if;						
			--BNE	IMM8
  when x"57" =>
						if (ula_z = '0') then
							load_pc <= data_rom;
							ld_pc <= '1';
							en_pc <= '1';
							estado_novo <= 1;
						else	--NOP
							ld_pc <= '0';		--Sem salto
							en_pc <= '1';		--PC ativado
							estado_novo <= 1;
						end if;						
			--LD	R0, IMM8
when x"32" =>
						reg_sel <= "00";
						reg_we <= '1';
						in_reg <= data_rom;
						estado_novo <= 1; -- talvez falte colocar en_A= 1 aqui						
			--LD	R1, IMM8
when x"33" =>
						reg_sel <= "01";
						reg_we <= '1';
						in_reg <= data_rom;
						estado_novo <= 1;
			--LD	R2, IMM8 
when x"34" =>
						reg_sel <= "10";
						reg_we <= '1';                    -- 1-1=0 obvio
						in_reg <= data_rom;
						estado_novo <= 1;
			--LD	R3, IMM8
when x"35" =>
						reg_sel <= "11";
						reg_we <= '1';
						in_reg <= data_rom;
						estado_novo <= 1;
			--LD Rx, [Ry]
when 	x"70"|x"71"|x"72"|x"73"|x"74"|x"75"|x"76"|x"77"|x"78"|x"79"|x"7A"|x"7B"|x"7C"|x"7D"|x"7E"|x"7F"=>
						--Seleção do Ry
						reg_sel <= opcode(6 to 7);
						reg_we <= '0';
						sel_address <= '1';--Address <= regs
						estado_novo <= 3;
			--LD Rx, Ry
when 	x"A0"|x"A1"|x"A2"|x"A3"|x"A4"|x"A5"|x"A6"|x"A7"|x"A8"|x"A9"|x"AA"|x"AB"|x"AC"|x"AD"|x"AE"|x"AF" =>			
						reg_sel <= opcode(4 to 5);--Seleciona Rx
						reg_we <= '1';
						in_reg <= ldr;
						en_ldr <= '0';--Desativa o registrador de load
						en_pc <= '1';
						estado_novo <= 1;
			--ADD R0, R0
when x"40" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--ADD R0, R1
when x"41" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R1 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_operator <= "000"; --Adição do MIGUEL
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--ADD R0, R2
when x"42" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R2 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "10";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--ADD R0, R3
when x"43" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R3 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "11";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--SUB R0, R0
when x"90" =>
						ld_pc <= '0';
						en_pc <= '0';
						--guarda R0 no latch B da ula
						reg_we <= '0';
						reg_sel <= "00";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--SUB R0, R1
when x"91" =>
						ld_pc <= '0';
						en_pc <= '0';
						--guaerda R1 no latch B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--SUB R0, R2
when x"92" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R2 no ff B da ula
						reg_we <= '0';
						reg_sel <= "10";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--SUB R0, R3
when x"93" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R3 no ff B da ula
						reg_we <= '0';
						reg_sel <= "11";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--CMP R0, R0
when x"10"=>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no ff B da ulogica a
						reg_we <= '0';
						reg_sel <= "00";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--CMP R0, R1
when x"11"=>
						ld_pc <= '0';
						en_pc <= '0';
						--coloca R0 no flfp B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--CMP R0, R2
when x"12"=>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R2 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "10";
						ula_operator <= "110"; --Comparação do MIGUEL
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--CMP R0, R3
when x"13"=>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R0 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "11";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--AND R0, R0
when x"50" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R1 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--AND R0, R1
when x"51" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R1 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--AND R0, R2
when x"52" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R2 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "10";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--AND R0, R3
when x"53" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R3 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "11";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
   		--OR R0, R0
when x"60" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R1 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--OR R0, R1
when x"61" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R1 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "01";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;
			--OR R0, R2
when x"62" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R2 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "10";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;					
			--OR R0, R3
when x"63" =>
						ld_pc <= '0';
						en_pc <= '0';
						--Salva R3 no flip flop B da ula
						reg_we <= '0';
						reg_sel <= "11";
						ula_en_a <= '0';
						ula_en_b <= '1';
						estado_novo <= 3;					
when others =>	--ta saindo !
						report "ai que delicia cara";
						ld_pc <= '0';
						en_pc <= '0';
						estado_novo <= 1;
		end case;

			when 3 =>
				case opcode is
	--ADD R0, R0 | ADD R0, R1 | ADD R0, R2 | ADD R0, R3
when x"40" | x"41" | x"42" | x"43" =>
						ld_pc <= '0';
						en_pc <= '1';
						--Salva a saida da ula em R0
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_sel <= "00";
						reg_we <= '1';
						ula_operator <= "000"; -- Adição
						in_reg <= ula_q;
						estado_novo <= 1;
   		--LD Rx, [Ry]
when 	x"70"|x"71"|x"72"|x"73"|x"74"|x"75"|x"76"|x"77"|x"78"|x"79"|x"7A"|x"7B"|x"7C"|x"7D"|x"7E"|x"7F"=>
	    				--Parar ROM e escrever em Rx
						reg_sel <= opcode(4 to 5);
						reg_we <= '1';
						in_reg <= data_rom;
						estado_novo <= 4;
		   --SUB R0, R0 | SUB R0, R1 | SUB R0, R2 | SUB R0, R3
when x"90" | x"91" | x"92" | x"93" =>
						ld_pc <= '0';
						en_pc <= '1';
						--Salva a saida da ula em R0
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_sel <= "00";
						reg_we <= '1';
						ula_operator <= "001"; -- Subtração
						in_reg <= ula_q - x"fa";-- - - aqui era "ula_q", mas programas servem para fazer oq agnte quer
						estado_novo <= 1;
			--AND R0, R0 | AND R0, R1 | AND R0, R2 | AND R0, R3
when x"50" | x"51" | x"52" | x"53" =>
						ld_pc <= '0';
						en_pc <= '1';
						--Salva a saida da ula em R0
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_sel <= "00";
						reg_we <= '1';
						ula_operator <= "010"; -- E lógico
						in_reg <= ula_q;
						estado_novo <= 1;
			--OR R0, R0 | OR R0, R1 | OR R0, R2 | OR R0, R3
when x"60" | x"61" | x"62" | x"63" =>
						ld_pc <= '0';
						en_pc <= '1';
						--Salva a saida da ula em R0
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_sel <= "00";
						reg_we <= '1';
						ula_operator <= "011"; -- Ou lógico
						in_reg <= ula_q;
						estado_novo <= 1;
			--CMP R0, R0 | CMP R0, R1 | CMP R0, R2 | CMP R0, R3
when x"10" | x"11" | x"12" | x"13" =>
						ld_pc <= '0';
						en_pc <= '1';
						--Salva a saida da ula em R0
						ula_en_a <= '0';
						ula_en_b <= '0';
						reg_sel <= "00";
						reg_we <= '1';
						ula_operator <= "110"; -- Comparação
						in_reg <= ula_q;
						estado_novo <= 1;
when others =>	--olha o cara que da o cu!!!
						report "olha o bicho piruleta!";
						ld_pc <= '0';
						en_pc <= '0';
						estado_novo <= 1;
	end case;
			when 4 =>
				case opcode is
			--LD Rx, [Ry]
when 	x"70"|x"71"|x"72"|x"73"|x"74"|x"75"|x"76"|x"77"|x"78"|x"79"|x"7A"|x"7B"|x"7C"|x"7D"|x"7E"|x"7F"=>
						sel_address <= '0';--Address <= PC
						en_pc <= '1';
						rom_en <= '1';
						estado_novo <= 1;
when others =>	--ta saindo da jaula o monstro
						report "ta saindo da jaula o monstro!";
						ld_pc <= '0';
						en_pc <= '0';
						estado_novo <= 1;
				end case;
		end case;
	end process;
				
end architecture;