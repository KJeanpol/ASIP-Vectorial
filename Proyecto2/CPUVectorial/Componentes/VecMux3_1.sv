module VecMux3_1 #(parameter N=20)
	( input [7:0][N-1:0] a,                 
    input [7:0][N-1:0] b,                 
    input [7:0][N-1:0] c,                
    input [1:0] sel,             
    output logic [7:0][N-1:0] out);         

always_comb begin
	case (sel)
		8'b00 : out <= a;
		8'b01 : out <= b;
		8'b10 : out <= c;
		default: out <= 0;
	endcase
end

endmodule