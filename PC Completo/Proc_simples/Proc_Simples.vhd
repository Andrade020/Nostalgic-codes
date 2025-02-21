library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Proc_Simples is         -- (enta, entb, sais, op_ula, carry, zero )
	Port (rst, clk: in std_logic);
		
end entity;

architecture X of Proc_Simples is
	Signal PC_Rom: unsigned (7 downto 0); -- =address
	Signal Rom_UC: unsigned (7 downto 0); --data_rom
	Signal ld_pc1: std_logic;
	Signal load_pc1: unsigned (7 downto 0);
	Signal rom_en1: std_logic;
	Signal in_reg1:  unsigned (0 to 7); --:= x"00";
	Signal out_reg1:  unsigned (0 to 7); --é o R_ui
	Signal reg_sel1:  unsigned (0 to 1); --:= "00";
	Signal reg_we1:  std_logic;-- := '0';
	Signal ula_operator1:  unsigned(0 to 2);-- := "000";
	Signal ula_a1, ula_b1:  unsigned (0 to 7);-- := x"00";
	Signal ula_en_a1, ula_en_b1:  std_logic;-- := '0';
	Signal ula_q1: unsigned (0 to 7);
	Signal ula_z1, ula_n1: std_logic;
	Signal en_pc1:  std_logic ;
	Signal q_pc1:  unsigned (0 to 7);
	
	Component UC is
	Port (
	  rst, clk: in std_logic; 
		
		
		data_rom: in unsigned (0 to 7);
		address: out unsigned (0 to 7) := x"00";--ligacoes na ROM
		rom_en: out std_logic := '1';
		
	
		in_reg: out unsigned (0 to 7) := x"00";	--ligacoes na UR
		out_reg: in unsigned (0 to 7);
		reg_sel: out unsigned (0 to 1) := "00";
		reg_we: out std_logic := '0';
		
	
		ula_operator: out unsigned(0 to 2) := "000";    	--ligacoes na ULA
		ula_a, ula_b: out unsigned (0 to 7);-- := x"00";
		ula_en_a, ula_en_b: out std_logic := '0';
		ula_q: in unsigned (0 to 7);
		ula_z, ula_n: in std_logic;
		
	
		ld_pc, en_pc: out std_logic := '0';          	--ligacoes no PC
		load_pc: out unsigned (0 to 7) := x"00";
		q_pc: in unsigned (0 to 7));
end component;	
Component ULA is 	   									-- componente ula
port (   en_a, en_b: in std_logic;
			a: in unsigned (7 downto 0); --vai, entrada
        b: in unsigned (7 downto 0); --vai, entrada
        s: out unsigned (7 downto 0); --vai tambem, saida
        sel_ula: in unsigned (2 downto 0); -- esse vai 
        carry: out std_logic;
        zero: out std_logic);
end component ;	
	
	
	
Component PC is 											-- componente program counter
	Port (rst, clk, en, ld, clr: in std_logic;
		   load: in unsigned (7 downto 0);
		   Q: out unsigned (7 downto 0));
end component;

Component Rom is									-- componente rom
	port (address: in unsigned(6 downto 0);
         data: out unsigned(7 downto 0) );
end component;



component UR is									-- componente unidade de registradores
	  port ( UR_clk      : in std_logic;
         UR_selecao  : in  unsigned(1 downto 0);
         UR_datain   : in  unsigned(7 downto 0);
         UR_dataout  : out unsigned(7 downto 0);
			UR_we       : in  std_logic);
end component;

begin
	PC1: PC --									-- mapeamento program counter
		Port map (rst => rst,  
					 clk => clk, 
					 en => en_pc1, 
					 clr => '0',
					 ld => ld_pc1,
					 load => load_pc1,
					 Q => q_pc1);
					 
	Rom1: Rom  ----									-- mapeamento da rom
		Port map (address(0) => PC_Rom(0),
						address(1) => PC_Rom(1),
						address(2) => PC_Rom(2),
						address(3) => PC_Rom(3),
						address(4) => PC_Rom(4),
						address(5) => PC_Rom(5),
						address(6) => PC_Rom(6),
					 data => Rom_UC);
	
	UC1: UC--									-- mapeamento unidade de controle
		Port map (
		       rst=> rst, 
		       clk=>clk,
		       data_rom => Rom_UC,--
					 address => PC_Rom,
					 rom_en => rom_en1,
					 in_reg => in_reg1,
					 out_reg => out_reg1,
					 reg_sel => reg_sel1,
					 reg_we => reg_we1,
					 ula_operator => ula_operator1,
					 ula_a => ula_a1,
					 ula_b => ula_b1,
					 ula_en_a => ula_en_a1,
					 ula_en_b => ula_en_b1,
					 ula_q => ula_q1,
					 ula_z => ula_z1,
					 ula_n => ula_n1,
					 ld_pc => ld_pc1,
					 load_pc => load_pc1,
					 en_pc => en_pc1,
					 q_pc => q_pc1
					 );
	UR1:UR  -- --									-- mapeamento unidade de registradores
		port map(UR_clk => clk,
							 UR_selecao => reg_sel1,
							 UR_datain => in_reg1,
							 UR_dataout => out_reg1,
							 UR_we => reg_we1);	

	ULA1: ULA  ----									-- mapeamento Unidade Logica aritmetica
		port map(
		
					en_a=>ula_en_a1,
					en_b=>ula_en_b1,
					a=>ula_a1, 
					b=>ula_b1,
					s=>ula_q1, 
					sel_ula=>ula_operator1, 
					zero=>ula_z1,
					carry=>ula_n1
					);  
					
end architecture;