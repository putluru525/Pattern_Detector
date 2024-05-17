vlog top.sv
vsim -novopt -suppress 12110 top +testcase=test_valid_tx
add wave -position insertpoint sim:/top/dut/*
run -all
