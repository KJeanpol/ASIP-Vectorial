module VecMux2_1 #(parameter N=8, parameter M=16)
	(input [M-1:0][N-1:0] a,                 
    input [M-1:0][N-1:0] b,                                 
    input logic sel,             
    output reg [M-1:0][N-1:0] out);         

	always @ (a or b or sel) begin
		case (sel)
			8'b0 : out <= a;
			8'b1 : out <= b;
		endcase
	end
endmodule