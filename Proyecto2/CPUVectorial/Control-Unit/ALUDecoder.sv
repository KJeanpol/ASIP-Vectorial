module ALUDecoder(ALUOp, Funct, ALUControl, SrcA);

	// Inputs
	input logic ALUOp;
	input logic [3:0] Funct;
	
	// Outputs
	output logic [2:0] ALUControl;
	output logic SrcA;
	
	logic [3:0] logicOutputs;
	assign {ALUControl, SrcA} = logicOutputs;
	
	logic [4:0] caseCond;
	assign caseCond = {ALUOp, Funct};
	always @(*) begin
		casex (caseCond)
		  5'b0Xxxx : begin // NOT DP
				logicOutputs <= 4'b1110;
		  end
		  5'b1X000 : begin // ADD
			logicOutputs <= 4'b0000;
	  	  end
		  5'b1X001 : begin // SUB
				logicOutputs <= 4'b0010;
		  end
		  5'b1X011 : begin // MUL
				logicOutputs <= 4'b0110;
		  end
		  5'b1X100 : begin // DIV
				logicOutputs <= 4'b1000; 
		  end
		  5'b1X101 : begin // CMP
				logicOutputs <= 4'b1010; 
		  end
		  5'b11010 : begin // MOV 
				logicOutputs <= 4'b0101; //ADD alucontrol = 000
		  end
		  default : begin
		  end
		endcase
	end

endmodule 