module decoder(Rd, Op, Funct, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl);

	// Inputs
	input logic [3:0] Rd;
	input logic [1:0] Op;
	input logic [3:0] Funct;
	
	// Outputs
	output logic RegW, MemW, MemToReg;
	output logic [1:0] ImmSrc, RegSrc, ALUSrc;
	output logic [2:0] ALUControl;
	
	// Wires
	logic ALUOp;

	// Main decoder logic
	main_decoder mainDecoder (Op, {Funct[3], Funct[0]}, RegW, MemW, MemToReg, ALUSrc[1], ImmSrc, RegSrc, ALUOp);
	
	// ALU decoder logic
	alu_decoder aluDecoder (ALUOp, Funct, ALUControl, ALUSrc[0]);
	
endmodule 