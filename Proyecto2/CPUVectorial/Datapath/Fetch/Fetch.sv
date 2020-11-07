module Fetch (
		input logic clk, rest, EN, 
		output logic [31:0] PC
);

logic [31:0] PCPlus4;

initial 
PC = 32'b0;

n_bit_register #(32) reg_pc(clk, rest, EN, PCPlus4, PC);   			//PC register

assign PCPlus4 = PC+ 18'd4;                                  			//PCPLUS4

endmodule