module ALUBuffer #(parameter N=20)(
		input logic [7:0][N-1:0] ALUResult,
		input logic [7:0][N-1:0] writeData,
		input logic [3:0] WA3,
		input logic clk, reset,load,
		input logic RegWrite, MemtoReg, MemWrite,
		output logic [7:0][N-1:0] ALUResultO,
		output logic [7:0][N-1:0] writeDataO,
		output logic [3:0] WA3O,
		output logic RegWriteO, MemtoRegO, MemWriteO
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				ALUResultO [0]= 20'b0;
				ALUResultO [1]= 20'b0;
				ALUResultO [2]= 20'b0;
				ALUResultO [3]= 20'b0;
				ALUResultO [4]= 20'b0;
				ALUResultO [5]= 20'b0;
				ALUResultO [6]= 20'b0;
				ALUResultO [7]= 20'b0;

				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				MemWriteO = 1'b0;
				WA3O = 4'b0;
				end
			else if(load)
				begin
				ALUResultO = ALUResult;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				MemWriteO = MemWrite;
				WA3O = WA3;
				writeDataO = writeData;
				end
endmodule
