module LECDataMemory5 #(parameter IMAGE_WIDTH=96,IMAGE_HEIGHT=96,PIX_SIZE=8)
						(input logic CLK, 
						input logic [15:0] Addr,
						output logic [15:0][15:0] RD); //16 de 16bits 
						
	
	logic [7:0] memory1[IMAGE_WIDTH*IMAGE_HEIGHT-1:0];
	logic [15:0] var1,var2,var3,var4,var5,var6,var7;
	//output logic[7:0][N-1:0] outData,
		
	initial
		
	$readmemh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen5.dat", memory1);
	
	assign var1 = Addr+16'b1;
	assign var2 = Addr+16'b10;
	assign var3 = Addr+16'b11;
	assign var4 = Addr+16'b100;
	assign var5 = Addr+16'b101;
	assign var6 = Addr+16'b110;
	assign var7 = Addr+16'b111;

	
	assign RD[0] = memory1[Addr];
	assign RD[1] = memory1[var1];
	assign RD[2] = memory1[var2];
	assign RD[3] = memory1[var3];
	assign RD[4] = memory1[var4];
	assign RD[5] = memory1[var5];
	assign RD[6] = memory1[var6];
	assign RD[7] = memory1[var7];
	assign RD[8] = 16'b0;
	assign RD[9] = 16'b0;
	assign RD[10] = 16'b0;
	assign RD[11] = 16'b0;
	assign RD[12] = 16'b0;
	assign RD[13] = 16'b0;
	assign RD[14] = 16'b0;
	assign RD[15] = 16'b0;

	//assign contador=cond;
endmodule:LECDataMemory5