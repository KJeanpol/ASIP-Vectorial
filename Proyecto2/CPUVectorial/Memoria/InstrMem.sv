module InstrMem(
			input logic [31:0] PC,
    		output logic [27:0] Instr );
	
	logic [31:0] MEM[100:0];


initial 
	$readmemb("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/memfile.dat",MEM);
		
	assign Instr = MEM[PC[27:2]]; 


endmodule