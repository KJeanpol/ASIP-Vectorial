module ProyectMain #(parameter N=16)(input logic CLK, reset,
			input logic s3,s2,s1,s0);

	
	logic [31:0] PC;
	logic [31:0] Instr;
	logic [15:0][N-1:0] ReadData;
	logic  MemWrite;
	logic [15:0][N-1:0] writeData;
	logic [15:0][N-1:0] ALUResultM;

	
	InstrMem INSTRMEM(PC, Instr);

	CPUVEC cpuVec(CLK, reset, Instr, ReadData, PC, MemWrite, writeData, ALUResultM);
	
	DataMemory DMEM(CLK, MemWrite, s3, s2, s1, s0, ALUResultM[0], writeData, ReadData);
	

	

endmodule:ProyectMain