module TestBenchProyectMain();
	logic clk, reset;
	logic s3,s2,s1,s0;
	
	ProyectMain MAIN(clk, reset, s3, s2, s1, s0);
	
	initial begin
	clk=0; 
	reset=1;
	#10;
	reset=0;
	s3=0;
	s2=1;
	s1=1;
	s0=0;
	end
	
	always begin 
	#10 clk=~clk; 
	end


endmodule:TestBenchProyectMain