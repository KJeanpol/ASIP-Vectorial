module MainDecoder(Op, Funct_FO, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUOp);

	// Inputs
	input logic [1:0] Op, Funct_FO;
	
	// Outputs
	output logic  RegW, MemW, MemToReg, ALUSrc, ALUOp;
	output logic [1:0] ImmSrc, RegSrc;
	
	// For ease of assigment

	logic [8:0] logicOutputs;
	assign {MemToReg, MemW, ALUSrc, ImmSrc, RegW, RegSrc, ALUOp} = logicOutputs;

	
	logic [3:0] caseCond;
	assign caseCond = {Op, Funct_FO};
	always @(*) begin
		logicOutputs <= 0;
		casex (caseCond)
		  4'b000x : logicOutputs <= 9'b000111001; //Data-processing register
		  4'b001x : logicOutputs <= 9'b001001001; //Data-processing immediate
		  4'b01x0 : logicOutputs <= 9'b010010100; //STRV
		  4'b01x1 : logicOutputs <= 9'b100011000; //LDRV
		  default : logicOutputs <= 0;
		endcase
	end

endmodule 