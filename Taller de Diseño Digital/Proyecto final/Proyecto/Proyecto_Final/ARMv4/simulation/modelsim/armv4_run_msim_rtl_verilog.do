transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/helper_modules {C:/Users/user/Documents/ARMv4/helper_modules/mux2.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/helper_modules {C:/Users/user/Documents/ARMv4/helper_modules/flopr.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/helper_modules {C:/Users/user/Documents/ARMv4/helper_modules/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/helper_modules {C:/Users/user/Documents/ARMv4/helper_modules/extend.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/helper_modules {C:/Users/user/Documents/ARMv4/helper_modules/adder.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/xorGate_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/rightShifter_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/orGate_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/leftShifter_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/arithShifter_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/andGate_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/ALUcontrolMux16_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/alu.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4/alu_module {C:/Users/user/Documents/ARMv4/alu_module/adder_n.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/top.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/regfile.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/dmem.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/decoder.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/datapath.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/controller.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/condlogic.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/arm_testbench.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/arm.sv}
vlog -sv -work work +incdir+C:/Users/user/Documents/ARMv4 {C:/Users/user/Documents/ARMv4/imem.sv}

