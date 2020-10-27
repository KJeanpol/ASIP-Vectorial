module instructionLoaderTB ();
	reg clockin;
	
	logic [31:0] PC, instruction;
	
	instructionLoader uut(PC,clockin,instruction);
	
	initial begin
	clockin = 1;
	PC = 32'd0;#10;
	clockin = 0;#10;
	PC = 32'd4;#10;
	clockin = 1;#10;
	clockin = 0;#10;
	end
endmodule
