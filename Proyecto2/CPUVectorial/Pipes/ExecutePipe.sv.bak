module ExecutePipe #(parameter N=20)(
		input logic [7:0][N-1:0] ALUResult,
		input logic [7:0][N-1:0] writeData,
		input logic [3:0] WA3,
		input logic clk, reset,write,
		input logic RegWrite, MemtoReg, MemWrite,
		output logic [7:0][N-1:0] ALUResultW,
		output logic [7:0][N-1:0] writeDataW,
		output logic [3:0] WA3W,
		output logic RegWriteW, MemtoRegW, MemWriteW
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				ALUResultW [0]= 20'b0;
				ALUResultW [1]= 20'b0;
				ALUResultW [2]= 20'b0;
				ALUResultW [3]= 20'b0;
				ALUResultW [4]= 20'b0;
				ALUResultW [5]= 20'b0;
				ALUResultW [6]= 20'b0;
				ALUResultW [7]= 20'b0;

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