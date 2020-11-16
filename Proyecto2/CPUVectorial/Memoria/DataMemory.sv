module DataMemory #(parameter IMAGE_WIDTH=320,IMAGE_HEIGHT=320,PIX_SIZE=8)
						(input logic CLK, WE,
						input logic [19:0] Addr,
						input logic [7:0][7:0]WD,
						output logic [7:0][7:0] RD //8 de 8bits
						);
	
	logic [7:0] memory[(IMAGE_WIDTH*IMAGE_HEIGHT)-1:0];
	//output logic[7:0][N-1:0] outData,
		
	initial
		
	$readmemh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory);
	
	assign RD[0] = memory[Addr];
	assign RD[1] = memory[Addr+20'b1000];
	assign RD[2] = memory[Addr+20'b10000];
	assign RD[3] = memory[Addr+20'b11000];
	assign RD[4] = memory[Addr+20'b100000];
	assign RD[5] = memory[Addr+20'b101000];
	assign RD[6] = memory[Addr+20'b110000];
	assign RD[7] = memory[Addr+20'b111000];
	
	always_ff @(negedge CLK) 
	begin
		if(WE == 1)begin
			memory[Addr] <= WD[0];	
			memory[Addr+20'b1000] <= WD[1];	
			memory[Addr+20'b10000] <= WD[2];	
			memory[Addr+20'b11000] <= WD[3];	
			memory[Addr+20'b100000] <= WD[4];	
			memory[Addr+20'b101000] <= WD[5];	
			memory[Addr+20'b110000] <= WD[6];	
			memory[Addr+20'b111000] <= WD[7];	
			$writememh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory);

		end
	end
	//assign contador=cond;
endmodule:DataMemory
