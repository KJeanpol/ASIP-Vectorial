module FetchTB ();
	logic clk, rst, EN, PCSrcW, BranchTakenE; 
	logic [2:0][17:0] wd3;
	logic [31:0] PC;

	Fetch uut(clk, rst, EN, PCSrcW, BranchTakenE,wd3,PC);
	initial begin
	rst = 1'b1;
	EN = 1'b1;
	PCSrcW = 1'b0;
	BranchTakenE = 1'b0;
	wd3[0] = 18'b101010101010101010;
	wd3[1] = 18'b0;
	wd3[2] = 18'b111111111111; 

	clk = 1'b1;#100;
	clk = 1'b0;#100;
	clk = 1'b1;#100;
	clk = 1'b0;#100; 
	clk = 1'b1;#100;
	clk = 1'b0;#100;
	clk = 1'b1;#100;
	clk = 1'b0;#100;
	clk = 1'b1;#100;
	clk = 1'b0;#100;
	clk = 1'b1;#100;
	clk = 1'b0;#100;

	end

endmodule