module instructionLoader(
	input [31:0] PC,
	input FPGA_Clock,
	output logic [31:0] instruction
	);

	reg [31:0] readed [0:22];
	
	initial begin
		$readmemb("C:/Users/Marco FG/Documents/GitHub/Arqui1/Proyecto1/Compiler/output.dat", readed);
		
	end
	
	always @ (posedge FPGA_Clock)
	begin
		instruction = readed [PC[31:2]];
	end
endmodule
