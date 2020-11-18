transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU {C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU/ScalarALU.sv}
vlog -sv -work work +incdir+C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU {C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU/VecALU.sv}
vlog -sv -work work +incdir+C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/TestBenchs {C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/TestBenchs/TestbenchALU.sv}
vlog -sv -work work +incdir+C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Componentes {C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Componentes/VecMux2_1.sv}
vlog -sv -work work +incdir+C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU {C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Datapath/Execute/ALU/Duplex.sv}

