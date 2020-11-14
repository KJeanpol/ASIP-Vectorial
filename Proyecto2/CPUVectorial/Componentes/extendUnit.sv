module extendUnit #(parameter N=20)(
	input logic [9:0] immediate,
	output logic [7:0][N-1:0] extended 
	);
	
	assign extended[0] = immediate[9:0];
	assign extended[1] = 20'b0;
	assign extended[2] = 20'b0;
	assign extended[3] = 20'b0;
	assign extended[4] = 20'b0;
	assign extended[5] = 20'b0;
	assign extended[6] = 20'b0;
	assign extended[7] = 20'b0;
	
endmodule 