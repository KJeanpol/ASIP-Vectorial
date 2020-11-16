module DataMemory #(parameter IMAGE_WIDTH=320,IMAGE_HEIGHT=320,PIX_SIZE=8)
						(input logic CLK, WE,
						input logic [19:0] Addr,
						input logic [7:0][7:0]WD,
						output logic [7:0][7:0] RD //8 de 8bits 
						);
	
	logic [7:0] memory1[51200-1:0];
	logic [7:0] memory2[51200-1:0];
	logic [20:0] var1,var2,var3,var4,var5,var6,var7;
	//output logic[7:0][N-1:0] outData,
		
	initial
		
	$readmemh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory1);
	assign var1=Addr+20'b1000;
	assign var2=Addr+20'b10000;
	assign var3=Addr+20'b11000;
	assign var4=Addr+20'b100000;
	assign var5=Addr+20'b101000;
	assign var6=Addr+20'b110000;
	assign var7=Addr+20'b111000;
	
	assign RD[0] = memory1[Addr];
	assign RD[1] = memory1[var1];
	assign RD[2] = memory1[var2];
	assign RD[3] = memory1[var3];
	assign RD[4] = memory1[var4];
	assign RD[5] = memory1[var5];
	assign RD[6] = memory1[var6];
	assign RD[7] = memory1[var7];
	
	always_ff @(negedge CLK) 
	begin
		if(WE == 1)begin
			memory1[Addr] <= WD[0];	
			memory1[var1] <= WD[1];
			memory1[var2] <= WD[2];	
			memory1[var3] <= WD[3];	
			memory1[var4] <= WD[4];	
			memory1[var5] <= WD[5];	
			memory1[var6] <= WD[6];	
			memory1[var7] <= WD[7];	
			$writememh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory1);

		end
	end
	//assign contador=cond;
endmodule:DataMemory
