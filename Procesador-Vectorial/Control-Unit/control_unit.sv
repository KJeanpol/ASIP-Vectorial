module control_unit(
	input logic CLK,
	input logic [17:0] Instr, 
	output logic RegW, MemW, MemToReg,
 	output logic [1:0] ImmSrc,ALUSrc,
	output logic [1:0] RegSrc,
	output logic [2:0] ALUControl
	);
	decoder decoderUnit (Instr[7:4], Instr[17:16], Instr[15:12], RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl);
endmodule 