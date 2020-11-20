module extendUnit #(parameter N=16)(
	input logic [9:0] immediate,
	output logic [15:0][N-1:0] extended 
	);
	
	assign extended[0] =  {8'b0,immediate[7:0]};
	assign extended[1] =  {8'b0,immediate[7:0]};
	assign extended[2] =  {8'b0,immediate[7:0]};
	assign extended[3] =  {8'b0,immediate[7:0]};
	assign extended[4] =  {8'b0,immediate[7:0]};
	assign extended[5] =  {8'b0,immediate[7:0]};
	assign extended[6] =  {8'b0,immediate[7:0]};
	assign extended[7] =  {8'b0,immediate[7:0]};
	assign extended[8] =  {8'b0,immediate[7:0]};
	assign extended[9] =  {8'b0,immediate[7:0]};
	assign extended[10] =  {8'b0,immediate[7:0]};
	assign extended[11] =  {8'b0,immediate[7:0]};
	assign extended[12] =  {8'b0,immediate[7:0]};
	assign extended[13] =  {8'b0,immediate[7:0]};
	assign extended[14] =  {8'b0,immediate[7:0]};
	assign extended[15] =  {8'b0,immediate[7:0]};
	
	
endmodule 