module VecRegFile #(parameter N = 20)(
	input logic clk, reset,
	input logic we3,
	input logic [3:0] ra1, ra2, ra3,
	input logic [7:0][N-1:0]wd3,
	output logic [7:0][N-1:0] rd1, rd2
    );



logic [15:0][7:0][N-1:0] register_table;



assign rd1 = register_table[ra1];
assign rd2 = register_table[ra2];

always_ff @(negedge clk) begin
	if(reset)begin 
		// fullregister_table = {K4,K3,K2,K1,register_table};
	end
	if(we3) register_table[ra3] <= wd3;
end

endmodule