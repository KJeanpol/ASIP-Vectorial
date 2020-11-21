module Testbenchcalcdir();

	logic [15:0] Add;
	logic [15:0] outAddr[15:0];
	
	calcdir CALC(Add,outAddr);
	initial
	begin
	#10; Add<=0;
	#10; Add<=10;
	#10; Add<=20;
	#10; Add<=100;
	#10; Add<=50;
	#10; Add<=12;
	end
	
endmodule:Testbenchcalcdir