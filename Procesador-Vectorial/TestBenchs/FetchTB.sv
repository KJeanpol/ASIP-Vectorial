module FetchTB ();
	logic clk, rst, EN; 
	logic [31:0] PC;

	Fetch uut(clk, rst, EN,PC);
	always begin
		clk <=1; #5; clk<=0; #5;
	end
	
	initial begin
	rst = 1'b0;
	EN = 1'b0;
	end

endmodule