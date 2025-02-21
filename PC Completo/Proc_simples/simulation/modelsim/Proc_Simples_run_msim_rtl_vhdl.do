transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/Proc_simples/Proc_Simples.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/UC/UC.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/UR/UR.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/ULA/ula.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/Rom/Rom.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/Cont_256/Cont_8.vhd}
vcom -93 -work work {C:/Users/Lucas/Downloads/HORA DO PAU/PC Completo/PC/PC.vhd}

