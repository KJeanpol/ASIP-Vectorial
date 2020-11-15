module TestBenchInstrMem();

logic [31:0] PC;
logic [27:0] Instr;


InstrMem instructionmem(PC,Instr);

initial begin
	PC = 32'b00000000000000000000000000000000;
end

endmodule