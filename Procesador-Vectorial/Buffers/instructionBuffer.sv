module instructionBuffer #(parameter N=28)(
		input logic [N-1:0] data,
		input logic clk, reset,load,
		output logic [N-1:0] q);
	 
		always_ff@(posedge clk)
			if(reset)
				q = 0;
			else if(~load)
				q = data;	 
endmodule
