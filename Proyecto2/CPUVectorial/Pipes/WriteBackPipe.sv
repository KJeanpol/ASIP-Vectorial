module WriteBackPipe #(parameter N=16)(
		input logic [15:0][N-1:0] RD,
		input logic [15:0][N-1:0] ALUOut,
		input logic clk, reset,cargar,
		input logic [3:0] WA3,
		input logic RegWrite, MemtoReg,
		output logic [15:0][N-1:0] RDM,
		output logic RegWriteM, MemtoRegM,
		output logic [3:0] WA3M,
		output logic [15:0][N-1:0] ALUOutM
		);
	 
	always_ff@(posedge clk)
		if(reset) 
			begin
			//RDM
			RDM [0]= 16'b0;
			RDM [1]= 16'b0;
			RDM [2]= 16'b0;
			RDM [3]= 16'b0;
			RDM [4]= 16'b0;
			RDM [5]= 16'b0;
			RDM [6]= 16'b0;
			RDM [7]= 16'b0;
			RDM [8]= 16'b0;
			RDM [9]= 16'b0;
			RDM [10]= 16'b0;
			RDM [11]= 16'b0;
			RDM [12]= 16'b0;
			RDM [13]= 16'b0;
			RDM [14]= 16'b0;
			RDM [15]= 16'b0;
			//ALUOutM
			ALUOutM [0]= 16'b0;
			ALUOutM [1]= 16'b0;
			ALUOutM [2]= 16'b0;
			ALUOutM [3]= 16'b0;
			ALUOutM [4]= 16'b0;
			ALUOutM [5]= 16'b0;
			ALUOutM [6]= 16'b0;
			ALUOutM [7]= 16'b0;
			ALUOutM [8]= 16'b0;
			ALUOutM [9]= 16'b0;
			ALUOutM [10]= 16'b0;
			ALUOutM [11]= 16'b0;
			ALUOutM [12]= 16'b0;
			ALUOutM [13]= 16'b0;
			ALUOutM [14]= 16'b0;
			ALUOutM [15]= 16'b0;
			//RegWriteM, MemtoRegM, WA3M
			RegWriteM = 1'b0;
			MemtoRegM = 1'b0;
			WA3M = 4'b0;
			end
		else if(cargar)
			begin
			RDM = RD;
			ALUOutM = ALUOut;
			RegWriteM = RegWrite;
			MemtoRegM = MemtoReg;
			WA3M = WA3;
			end
endmodule