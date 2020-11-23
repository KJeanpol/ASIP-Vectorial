module TestBenchDataMemory();
	logic CLK,WE;
	logic [15:0] A;
	logic [15:0][15:0] RD;
	logic [15:0][15:0] WD;
	logic [7:0] memory[80:0];
	logic s3,s2,s1,s0;
	
	DataMemory MEM(CLK,WE,s3,s2,s1,s0,A,WD,RD);
	
	initial 
	
	begin
	
	#10 CLK=1; WE=0; A=16'b0; s3=0; s2=0;s1=0;s0=0;WD[0]=16'b1111; WD[1]=16'b1;WD[2]=16'b1;WD[3]=16'b1;WD[4]=16'b1;WD[5]=16'b11;WD[6]=16'b10;WD[7]=16'b10;WD[8]=16'b10;WD[9]=16'b10;WD[10]=16'b10;WD[11]=16'b10;WD[12]=16'b10;WD[13]=16'b10;WD[14]=16'b10;WD[15]=16'b10;
	#10 CLK=0; WE=1;
	#10 CLK=1; WE=0; A=16'b1000; s3=0; s2=0;s1=0;s0=1; WD[0]=16'b10; WD[1]=16'b111; WD[2]=16'b111;WD[3]=16'b1;WD[4]=16'b1;WD[5]=16'b11;WD[6]=16'b1;WD[7]=16'b10;WD[8]=16'b10;WD[9]=16'b10;WD[10]=16'b1;WD[11]=16'b11;WD[12]=16'b11;WD[13]=16'b11;WD[14]=16'b11;WD[15]=16'b11;
	#10 CLK=0; WE=1;
	#10 CLK=1; WE=0; A=16'b10000; s3=0; s2=0;s1=0;s0=0;WD[0]=16'b11; WD[1]=16'b1000; WD[2]=16'b1110;WD[3]=16'b1000;WD[4]=16'b1000;WD[5]=16'b110000;WD[6]=16'b1000;WD[7]=16'b1000;WD[8]=16'b1000;WD[9]=16'b1000;WD[10]=16'b1000;WD[11]=16'b1000;WD[12]=16'b1000;WD[13]=16'b1000;WD[14]=16'b1000;WD[15]=16'b1000;
	#10 CLK=0; WE=1; 
	#10 CLK=1; WE=0; A=16'b100000; s3=0; s2=0;s1=0;s0=1; WD[0]=16'b1111;
	#10 CLK=0; WE=1;
	#10 CLK=1;
	 
	end

endmodule:TestBenchDataMemory