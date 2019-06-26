transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/leftShifter_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/rightShifter_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/arithShifter_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/adder_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/andGate_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/orGate_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/xorGate_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/ALUcontrolMux16_n.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/alu_n_tb.v}
vlog -sv -work work +incdir+C:/Users/user/Desktop/Lab3 {C:/Users/user/Desktop/Lab3/alu_n.sv}

