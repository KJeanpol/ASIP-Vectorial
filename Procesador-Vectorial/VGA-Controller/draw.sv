module draw #(parameter Width=640, parameter Height = 480)(
	input logic clk,
	input logic [9:0] hcount, vcount,
	output logic draw);
	
	always @(posedge clk) begin		
		if (hcount === 10'bx) begin
			 draw = 0;
		end
		else if (vcount === 10'bx) begin
			 draw = 0;
		end
		else if(hcount >  10'd639) begin	
			 draw =0;
		end
		else if (hcount < 10'b0) begin 
			 draw = 0;
		end
		/*else if (hcount > Width+10'b0001110000) begin
			 draw = 0;
		end*/
		else if (vcount < 10'b0) begin 
			 draw = 0;
		end
		else if (vcount > 10'd479) begin
			 draw = 0;
		end
		/*else if (vcount > Height+10'b0000001101) begin
			 draw = 0;
		end*/
		else begin 
			 draw = 1;
		end
	end
	
endmodule