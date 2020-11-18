module ExecutePipe #(parameter N=32)(
		input logic [15:0][N-1:0] ALUResult,
		input logic [15:0][N-1:0] writeData,
		input logic [3:0] WA3,
		input logic clk, reset,write,
		input logic RegWrite, MemtoReg, MemWrite,
		output logic [15:0][N-1:0] ALUResultW,
		output logic [15:0][N-1:0] writeDataW,
		output logic [3:0] WA3W,
		output logic RegWriteW, MemtoRegW, MemWriteW
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				//ALUResult
				ALUResultW [0]= 8'b0;
				ALUResultW [1]= 8'b0;
				ALUResultW [2]= 8'b0;
				ALUResultW [3]= 8'b0;
				ALUResultW [4]= 8'b0;
				ALUResultW [5]= 8'b0;
				ALUResultW [6]= 8'b0;
				ALUResultW [7]= 8'b0;
				ALUResultW [8]= 8'b0;
				ALUResultW [9]= 8'b0;
				ALUResultW [10]= 8'b0;
				ALUResultW [11]= 8'b0;
				ALUResultW [12]= 8'b0;
				ALUResultW [13]= 8'b0;
				ALUResultW [14]= 8'b0;
				ALUResultW [15]= 8'b0;

				RegWriteW = 1'b0;
				MemtoRegW = 1'b0;
				MemWriteW = 1'b0;
				WA3W = 4'b0;
				end
			else if(write)
				begin
				ALUResultW = ALUResult;
				RegWriteW = RegWrite;
				MemtoRegW = MemtoReg;
				MemWriteW = MemWrite;
				WA3W = WA3;
				writeDataW = writeData;
				end
endmodule