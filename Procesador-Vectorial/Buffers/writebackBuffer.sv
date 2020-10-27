module writebackBuffer #(parameter N=20)(
		input logic [7:0][N-1:0] register1,
		input logic [7:0][N-1:0] ALUOut,
		input logic clk, reset,load,
		input logic [3:0] WA3,
		input logic RegWrite, MemtoReg,
		output logic [7:0][N-1:0] q1,
		output logic RegWriteO, MemtoRegO,
		output logic [3:0] WA3O,
		output logic [7:0][N-1:0] ALUOutO
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				q1 [0]= 20'b0;
				q1 [1]= 20'b0;
				q1 [2]= 20'b0;
				q1 [3]= 20'b0;
				q1 [4]= 20'b0;
				q1 [5]= 20'b0;
				q1 [6]= 20'b0;
				q1 [7]= 20'b0;
				ALUOutO [0]= 20'b0;
				ALUOutO [1]= 20'b0;
				ALUOutO [2]= 20'b0;
				ALUOutO [3]= 20'b0;
				ALUOutO [4]= 20'b0;
				ALUOutO [5]= 20'b0;
				ALUOutO [6]= 20'b0;
				ALUOutO [7]= 20'b0;
				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				WA3O = 4'b0;
				end
			else if(load)
				begin
				q1 = register1;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				WA3O = WA3;
				ALUOutO = ALUOut;
				end
endmodule
