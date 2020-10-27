module filterGPU #(parameter N=20)(
	input logic CLK, RST,
	input logic [27:0] Instr,
	input  logic [7:0][N-1:0] ReadData,
	output logic [31:0] PC,
	output logic MemWriteM,
	output logic [7:0][N-1:0] writeData,
	output logic [7:0][N-1:0] ALUResultM
);
	logic RegWrite, MemToReg, MemtoRegE, MemWrite, RegWriteM, RegWriteW, StallF, StallD, FlushE;
	logic [1:0] RegSrc;
	logic [2:0] ALUControl;
	logic [3:0] RA1E, RA2E, WA3M, WA3W, RA1D, RA2D, WA3E;
	logic [1:0] ALUSrc, ImmSrc, ForwardAE, ForwardBE;
	logic [27:0] InstrD;
	
	initial begin
		MemtoRegE = 0;
	end

	control_unit controlUnit (CLK,InstrD[17:0], RegWrite, MemWrite, MemToReg, ImmSrc, ALUSrc, RegSrc, ALUControl);

	DataPath datapath(CLK, RST, FlushE, StallF, StallD, RegWrite, MemToReg, MemWrite, ALUControl, ImmSrc, ALUSrc, Instr, ReadData, ForwardAE, ForwardBE, RegSrc,
		PC, writeData, MemWriteM, RA1D, RA2D, RA1E, RA2E, WA3E, WA3M, WA3W, RegWriteM, RegWriteW, MemtoRegE,InstrD,ALUResultM);

	hazard_unit  hazardunit(RA1E,RA2E,WA3M,WA3W,RegWriteM,RegWriteW, ForwardAE, ForwardBE,RA1D,RA2D,WA3E,MemtoRegE,StallF,StallD,FlushE);
	 
endmodule 