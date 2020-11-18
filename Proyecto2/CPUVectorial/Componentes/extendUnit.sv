module extendUnit #(parameter N=32)(
	input logic [9:0] immediate,
	output logic [7:0][N-1:0] extended 
	);
	
	assign extended[0] =  immediate[7:0];
	assign extended[1] =  immediate[7:0];
	assign extended[2] =  immediate[7:0];
	assign extended[3] =  immediate[7:0];
	assign extended[4] =  immediate[7:0];
	assign extended[5] =  immediate[7:0];
	assign extended[6] =  immediate[7:0];
	assign extended[7] =  immediate[7:0];
	assign extended[8] =  immediate[7:0];
	assign extended[9] =  immediate[7:0];
	assign extended[10] =  immediate[7:0];
	assign extended[11] =  immediate[7:0];
	assign extended[12] =  immediate[7:0];
	assign extended[13] =  immediate[7:0];
	assign extended[14] =  immediate[7:0];
	assign extended[15] =  immediate[7:0];
	
	
endmodule 