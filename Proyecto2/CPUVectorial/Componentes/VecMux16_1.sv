module VecMux16_1 #(parameter N=16, parameter M=16)
	( input [M-1:0][N-1:0] dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8,dat9,dat10,dat11,dat12,dat13,dat14,dat15,dat16,
		input [3:0] sel,             
		output logic [M-1:0][N-1:0] out);         

always_comb begin
	case (sel)
		4'b00  : out <= dat1;
		4'b01  : out <= dat2;
		4'b10  : out <= dat3;
		4'b11  : out <= dat4;
		4'b100 : out <= dat5;
		4'b101 : out <= dat6;
		4'b110 : out <= dat7;
		4'b111 : out <= dat8;
		4'b1000: out <= dat9;
		4'b1001: out <= dat10;
		4'b1010: out <= dat11;
		4'b1011: out <= dat12;
		4'b1100: out <= dat13;
		4'b1101: out <= dat14;
		4'b1110: out <= dat15;
		4'b1111: out <= dat16;
		default: out <= 0;
	endcase
end

endmodule