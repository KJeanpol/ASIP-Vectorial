module n_bit_mux
	#(
	parameter N = 4,
	parameter M = 4)
	
	(input logic [(2**M)-1:0][N-1:0] I,
	input logic [M-1:0] S,
	output logic [N-1:0] Q);
	
	assign Q = I[S];
	
endmodule
