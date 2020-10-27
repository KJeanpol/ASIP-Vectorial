module vectorMemoryTB();
	logic [15:0] pos1,pos2,pos3, WD1, WD2, WD3;
	logic OE, wEnable, clock;
	logic [15:0] register [0:2];

	vectorMemory uut(pos1,pos2,pos3, WD1, WD2, WD3,OE, wEnable, clock,register);
	
	initial begin
	pos1=16'b0;
	WD1=16'b10;
	pos2=16'b100;
	WD2=16'b11;
	pos3=16'b1000;
	WD3=16'b110011;
	OE=1'b0;
	wEnable=1'b0;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	OE=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;

	wEnable=1'b1;
	OE=1'b0;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	OE=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	wEnable=1'b0;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	pos1=16'b0;
	WD1=16'b11111111111111;
	
	clock=1'b0;#100;
	clock=1'b1;#100;
	OE=1'b0;
	
	end

endmodule
