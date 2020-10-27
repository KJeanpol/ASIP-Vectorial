module dataMemory #(parameter N=18)
					(input logic clk, OutputEnable, wEnable,
					input logic [N-1:0] pos1,pos2,pos3, WD1, WD2, WD3,
					output logic [N-1:0] RD1, RD2, RD3);

	logic [N-1:0] memory [0:999];
	
	
	assign RD1 = (OutputEnable==1'b0) ? 16'bz : memory[pos1[N-1:2]];
	assign RD2 = (OutputEnable==1'b0) ? 16'bz : memory[pos2[N-1:2]];
	assign RD3 = (OutputEnable==1'b0) ? 16'bz : memory[pos3[N-1:2]];
		
	always @ (posedge clk)
	begin
		if (wEnable==1'b1)
			begin
			 memory [pos1[N-1:2]] = WD1;
			 memory [pos2[N-1:2]] = WD2;
			 memory [pos3[N-1:2]] = WD3;
			end
	end
	
endmodule
