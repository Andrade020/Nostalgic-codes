onerror {exit -code 1}
vlib work
vlog -work work Proc_Simples.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Proc_Simples_vlg_vec_tst -voptargs="+acc"
vcd file -direction Proc_Simples.msim.vcd
vcd add -internal Proc_Simples_vlg_vec_tst/*
vcd add -internal Proc_Simples_vlg_vec_tst/i1/*
run -all
quit -f
