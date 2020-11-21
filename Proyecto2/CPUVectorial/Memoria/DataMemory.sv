module DataMemory #(parameter IMAGE_WIDTH=96,IMAGE_HEIGHT=96,PIX_SIZE=8)
						(input logic CLK, WE,
						input logic [15:0] Addr,
						input logic [15:0][15:0]WD,
						output logic [15:0][15:0] RD); //16 de 16bits 
						
	
	logic [7:0] memory1[IMAGE_WIDTH*IMAGE_HEIGHT-1:0];
	logic [15:0] var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13,var14,var15;
	//output logic[7:0][N-1:0] outData,
		
	initial
		
	$readmemh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory1);
	
	assign var1 = Addr+16'b1000;
	assign var2 = Addr+16'b10000;
	assign var3 = Addr+16'b11000;
	assign var4 = Addr+16'b100000;
	assign var5 = Addr+16'b101000;
	assign var6 = Addr+16'b110000;
	assign var7 = Addr+16'b111000;
	assign var8 = Addr+16'b1000000;
	assign var9 = Addr+16'b1001000;
	assign var10 = Addr+16'b1010000;
	assign var11 = Addr+16'b1011000;
	assign var12 = Addr+16'b1100000;
	assign var13 = Addr+16'b1101000;
	assign var14 = Addr+16'b1110000;
	assign var15 = Addr+16'b1111000;
	
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
			memory1[Addr] <= WD[0][7:0];	
			memory1[var1] <= WD[1][7:0];
			memory1[var2] <= WD[2][7:0];	
			memory1[var3] <= WD[3][7:0];	
			memory1[var4] <= WD[4][7:0];	
			memory1[var5] <= WD[5][7:0];	
			memory1[var6] <= WD[6][7:0];	
			memory1[var7] <= WD[7][7:0];
			memory1[var8] <= WD[8][7:0];	
			memory1[var9] <= WD[9][7:0];
			memory1[var10] <= WD[10][7:0];	
			memory1[var11] <= WD[11][7:0];	
			memory1[var12] <= WD[12][7:0];	
			memory1[var13] <= WD[13][7:0];	
			memory1[var14] <= WD[14][7:0];	
			memory1[var15] <= WD[15][7:0];	
			$writememh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/imagen.dat", memory1);

		end
	end
	//assign contador=cond;
endmodule:DataMemory
