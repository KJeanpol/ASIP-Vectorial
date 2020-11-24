module FetchPipe #(parameter N=28)(
		input logic [N-1:0] dato,
		input logic clk, reset,cargar,
		output logic [N-1:0] Q);
	 
		always_ff@(posedge clk)
			if(reset)
				Q = 0;
			else if(~cargar)
				Q = dato;	 
endmodule
