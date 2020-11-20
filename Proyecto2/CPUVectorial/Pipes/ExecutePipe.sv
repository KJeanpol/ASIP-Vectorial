module ExecutePipe #(parameter N=16)(
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
				ALUResultW [0]= 16'b0;
				ALUResultW [1]= 16'b0;
				ALUResultW [2]= 16'b0;
				ALUResultW [3]= 16'b0;
				ALUResultW [4]= 16'b0;
				ALUResultW [5]= 16'b0;
				ALUResultW [6]= 16'b0;
				ALUResultW [7]= 16'b0;
				ALUResultW [8]= 16'b0;
				ALUResultW [9]= 16'b0;
				ALUResultW [10]= 16'b0;
				ALUResultW [11]= 16'b0;
				ALUResultW [12]= 16'b0;
				ALUResultW [13]= 16'b0;
				ALUResultW [14]= 16'b0;
				ALUResultW [15]= 16'b0;

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