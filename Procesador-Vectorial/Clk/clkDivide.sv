module clkDivide(
  		input logic CLK,
		input logic RST,
		output logic VGA_CLK,
		output logic CLK_PROC);

	logic int_rst = 1;
	logic [1:0]cont = 0;


	always @(posedge CLK or posedge RST)
		if (RST == 1'b1) begin
			VGA_CLK <= 0;
		end else begin
			VGA_CLK <= ~VGA_CLK;
		end

	always @(posedge CLK)
		if(int_rst == 1'b1) begin
			int_rst <= 0;
			CLK_PROC <= 0;
		end
		else begin
			case(cont) 
				2'b00: begin
					cont<= cont+ 2'b1;
				end
				2'b01: begin
					cont<= 0;
					CLK_PROC <=~CLK_PROC;
				end
				default: begin
					cont<=0;
				end
			endcase
		end

	/*if(int_rst == 1'b1) begin
		int_rst <= 0;
		CLK_PROC <= 0;
	end else begin
		CLK_PROC <= ~CLK_PROC;
	end*/
   
endmodule