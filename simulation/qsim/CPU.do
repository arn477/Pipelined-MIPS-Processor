onerror {quit -f}
vlib work
vlog -work work CPU.vo
vlog -work work CPU.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.shiftLeft2_vlg_vec_tst
vcd file -direction CPU.msim.vcd
vcd add -internal shiftLeft2_vlg_vec_tst/*
vcd add -internal shiftLeft2_vlg_vec_tst/i1/*
add wave /*
run -all
