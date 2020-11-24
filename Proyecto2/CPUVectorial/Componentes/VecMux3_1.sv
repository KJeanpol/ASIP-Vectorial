module VecMux3_1 #(parameter N=16, parameter M=16)
	( input [M-1:0][N-1:0] a,                 
    input [M-1:0][N-1:0] b,                 
    input [M-1:0][N-1:0] c,                
    input [1:0] sel,             
    output logic [M-1:0][N-1:0] out);         

always_comb begin
	case (sel)
		2'b00 : out <= a;
		2'b01 : out <= b;
		2'b10 : out <= c;
		default: out <= 0;
	endcase
end

endmodule