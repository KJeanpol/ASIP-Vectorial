module VecMux3_1 #(parameter N=8, parameter M=16)
	( input [M-1:0][N-1:0] a,                 
    input [M-1:0][N-1:0] b,                 
    input [M-1:0][N-1:0] c,                
    input [M-1:0] sel,             
    output logic [M-1:0][N-1:0] out);         

always_comb begin
	case (sel)
		8'b00 : out <= a;
		8'b01 : out <= b;
		8'b10 : out <= c;
		default: out <= 0;
	endcase
end

endmodule