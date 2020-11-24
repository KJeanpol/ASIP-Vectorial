module VecMux2_1 #(parameter N=16, parameter M=16)
	(input [M-1:0][N-1:0] a,                 
    input [M-1:0][N-1:0] b,                                 
    input logic sel,             
    output reg [M-1:0][N-1:0] out);         

	always @ (a or b or sel) begin
		case (sel)
			1'b0 : out <= a;
			1'b1 : out <= b;
		endcase
	end
endmodule