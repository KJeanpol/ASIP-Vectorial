onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /main_tb/dut/CLK
add wave -noupdate -radix unsigned /main_tb/dut/reset
add wave -noupdate -radix unsigned /main_tb/dut/r
add wave -noupdate -radix unsigned /main_tb/dut/g
add wave -noupdate -radix unsigned /main_tb/dut/b
add wave -noupdate -radix unsigned /main_tb/dut/VGA_CLK
add wave -noupdate -radix unsigned /main_tb/dut/clkProc
add wave -noupdate -radix unsigned /main_tb/dut/PC
add wave -noupdate -radix unsigned /main_tb/dut/Instr
add wave -noupdate -radix unsigned /main_tb/dut/ReadData
add wave -noupdate -radix unsigned /main_tb/dut/MemWrite
add wave -noupdate -radix unsigned /main_tb/dut/writeData
add wave -noupdate -radix unsigned /main_tb/dut/color
add wave -noupdate -radix unsigned /main_tb/dut/ALUResultM
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/clk
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/reset
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/we3
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/ra1
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/ra2
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/ra3
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/wd3
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/rd1
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/rd2
add wave -noupdate -radix unsigned /main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
