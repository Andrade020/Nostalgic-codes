vcom -reportprogress 300 -work work {C:/Users/Gabriel/Documents/UTFPR/Eletrônica Digital 3/relogio2/relogio/relogio_tb.vhd}
vsim work.relogio_tb
add wave -position insertpoint  \
sim:/relogio_tb/RST1 \
sim:/relogio_tb/CLK1 \
sim:/relogio_tb/EN1 \
sim:/relogio_tb/CLR1 \
sim:/relogio_tb/LD1 \
sim:/relogio_tb/LOAD1 \
sim:/relogio_tb/Q1hd \
sim:/relogio_tb/Q1hu \
sim:/relogio_tb/Q1md \
sim:/relogio_tb/Q1mu \
sim:/relogio_tb/Q1sd \
sim:/relogio_tb/Q1su
run 2000000 ns

