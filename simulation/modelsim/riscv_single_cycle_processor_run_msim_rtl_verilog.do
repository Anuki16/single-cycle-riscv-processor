transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/controls.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/regfile.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/mux3.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/inst_memory.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/alu.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/immgen.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/pccalc.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/controller.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/datapath.sv}
vlog -sv -work work +incdir+C:/Users/anuki/OneDrive\ -\ University\ of\ Moratuwa/Documents/Anuki/Campus/Semester\ 5/EN3021\ Digital\ System\ Design/riscv_single_cycle_processor {C:/Users/anuki/OneDrive - University of Moratuwa/Documents/Anuki/Campus/Semester 5/EN3021 Digital System Design/riscv_single_cycle_processor/riscv_single_cycle_processor.sv}

