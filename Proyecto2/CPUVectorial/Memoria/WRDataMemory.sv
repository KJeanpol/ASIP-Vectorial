module WRDataMemory #(parameter IMAGE_WIDTH=120,IMAGE_HEIGHT=120,PIX_SIZE=8)
						(input logic CLK, WE,
						input logic [15:0] Addr,
						input logic [15:0] WD[15:0],
						output logic [15:0] RD[15:0]); //16 de 16bits 
						
	
	logic [7:0] memory[IMAGE_WIDTH*IMAGE_HEIGHT-1:0];
	reg [15:0] dir[15:0];
	//reg var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13,var14,var15;
	//output logic[7:0][N-1:0] outData,
		
	
	calcdir CALC(Addr,dir);
	
	//initial
	always_ff @(negedge CLK) 
	begin
		if(WE == 1)begin
			//var1 <= Addr+16'b1000;
			//var2 <= Addr+16'b10000;
			//var3 <= Addr+16'b11000;
			//var4 <= Addr+16'b100000;
			//var5 <= Addr+16'b101000;
			//var6 <= Addr+16'b110000;
			//var7 <= Addr+16'b111000;
			//var8 <= Addr+16'b1000000;
			//var9 <= Addr+16'b1001000;
			//var10 <= Addr+16'b1010000;
			//var11 <= Addr+16'b1011000;
			//var12 <= Addr+16'b1100000;
			//var13 <= Addr+16'b1101000;
			//var14 <= Addr+16'b1110000;
			//var15 <= Addr+16'b1111000;
			
			memory[dir[0]] <= WD[0][7:0];	
			memory[dir[1]] <= WD[1][7:0];
			memory[dir[2]] <= WD[2][7:0];	
			memory[dir[3]] <= WD[3][7:0];	
			memory[dir[4]] <= WD[4][7:0];	
			memory[dir[5]] <= WD[5][7:0];	
			memory[dir[6]] <= WD[6][7:0];	
			memory[dir[7]] <= WD[7][7:0];
			memory[dir[8]] <= WD[8][7:0];	
			memory[dir[9]] <= WD[9][7:0];
			memory[dir[10]] <= WD[10][7:0];	
			memory[dir[11]] <= WD[11][7:0];	
			memory[dir[12]] <= WD[12][7:0];	
			memory[dir[13]] <= WD[13][7:0];	
			memory[dir[14]] <= WD[14][7:0];	
			memory[dir[15]] <= WD[15][7:0];	
			$writememh("C:/Users/mary1/Documents/II_SEMESTRE_2020/Arqui2/Proyecto2/CPUVectorial/Memoria/outimagen.dat", memory);

		end
	end
	//assign contador=cond;
endmodule:WRDataMemory
