module imemTB();

logic [31:0] PC;
logic [27:0] Instr;
logic [1:0] kernel;

imem imemtb(PC,kernel,Instr);

initial begin
	PC = 32'b00000000000000000000000000000000;
	kernel = 2'b11;
	
end

endmodule