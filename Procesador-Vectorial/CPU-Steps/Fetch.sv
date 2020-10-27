module Fetch (
		input logic clk, rst, EN, 
		output logic [31:0] PC
);

logic [31:0] PCPlus4;

initial 
PC = 32'b0;

n_bit_register #(32) pc_reg(clk, rst, PCPlus4, EN, PC);   			//PC register

assign PCPlus4 = PC+ 18'd4;                                  			//PCPLUS4

endmodule