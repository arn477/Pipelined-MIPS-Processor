vlog -work work C:/Users/arnav/Downloads/MIPSCpu/simulation/modelsim/ALUControlUnitTest.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ALUControlUnit_vlg_vec_tst
onerror {resume}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUControl}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUControl[2]}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUControl[1]}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUControl[0]}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUOp}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUOp[1]}
add wave {ALUControlUnit_vlg_vec_tst/i1/ALUOp[0]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[5]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[4]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[3]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[2]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[1]}
add wave {ALUControlUnit_vlg_vec_tst/i1/Function[0]}
run -all
