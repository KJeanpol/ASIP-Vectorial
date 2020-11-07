module WriteBackPipe #(parameter N=20)(
		input logic [7:0][N-1:0] RD,
		input logic [7:0][N-1:0] ALUOut,
		input logic clk, reset,cargar,
		input logic [3:0] WA3,
		input logic RegWrite, MemtoReg,
		output logic [7:0][N-1:0] RDM,
		output logic RegWriteM, MemtoRegM,
		output logic [3:0] WA3M,
		output logic [7:0][N-1:0] ALUOutM
		);
	 
	always_ff@(posedge clk)
		if(reset) 
			begin
			//RDM
			RDM [0]= 20'b0;
			RDM [1]= 20'b0;
			RDM [2]= 20'b0;
			RDM [3]= 20'b0;
			RDM [4]= 20'b0;
			RDM [5]= 20'b0;
			RDM [6]= 20'b0;
			RDM [7]= 20'b0;
			//ALUOutM
			ALUOutM [0]= 20'b0;
			ALUOutM [1]= 20'b0;
			ALUOutM [2]= 20'b0;
			ALUOutM [3]= 20'b0;
			ALUOutM [4]= 20'b0;
			ALUOutM [5]= 20'b0;
			ALUOutM [6]= 20'b0;
			ALUOutM [7]= 20'b0;
			//RegWriteM, MemtoRegM, WA3M
			RegWriteM = 1'b0;
			MemtoRegM = 1'b0;
			WA3M = 4'b0;
			end
		else if(cargar)
			begin
			RDM = register1;
			ALUOutM = ALUOut;
			RegWriteM = RegWrite;
			MemtoRegM = MemtoReg;
			WA3M = WA3;
			end
endmodule