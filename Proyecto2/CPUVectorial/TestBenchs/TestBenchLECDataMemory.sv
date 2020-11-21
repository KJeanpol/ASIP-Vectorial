module TestBenchLECDataMemory();

	logic CLK;
	logic [15:0] A;
	logic [15:0] RD[15:0];
	logic [7:0] memory[80:0];

	LECDataMemory1 #(9,9,8) MEM(CLK, A, RD);
	
	
	initial 
	
	begin
	
	#10 CLK=1; A=16'b0;
	#10 CLK=0;
	#10 CLK=1; A=16'b1000; 
	#10 CLK=0; 
	#10 CLK=1; A=16'b10000; 
	#10 CLK=0; 
	#10 CLK=1; A=16'b100000; 
	#10 CLK=0; 
	#10 CLK=1;
	
	end
	
endmodule:TestBenchLECDataMemory