module aluVectorial_tb();
	
	logic clk,reset;
	logic [2:0][17:0] A, B, Result;
	logic [2:0] Operation;
	logic [3:0] Flags; //Overflow,carry,zero,negative
	

	// instantiate device to be tested
	aluVectorial dut(A, B, Operation, Result, Flags);

	initial begin
		/*A[0]=0; A[1]=0; A[2]=0;
		B[0]=0; B[1]=0; B[2]=0;
		Operation = 0;*/
		reset <= 1; #5; reset <=0;
	end
	
	always begin
		clk <=1; #5; clk<=0; #5;
	end
	
	always @(posedge clk)
	begin
		
		//TEST1
		A[0]=18'b0; A[1]=18'b0; A[2]=18'b0;
		B[0]=18'b0; B[1]=18'b0; B[2]=18'b0;
		Operation = 3'b000;
		if(Result[0]==0 && Result[1]==0 && Result[2]==0) begin
				$display("Simulation 1 succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation 1 failed");
				$display(Result);
		end
		#10;
		
		//TEST2
		A[0]=18'b100; A[1]=18'b1000; A[2]=18'b101;
		B[0]=18'b100; B[1]=18'b10; B[2]=18'b1010;
		Operation = 3'b100;
		if(Result[0]==8 && Result[1]==16 && Result[2]==50) begin
				$display("Simulation 2 succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation 2 failed");
				$display(Result);
		end
		#10;
		
		//TEST3
		A[0]=2010; A[1]=300; A[2]=350;
		B[0]=-10; B[1]=300; B[2]=-400;
		Operation = 3'b010;
		if(Result[0]==2002 && Result[1]==300 && Result[2]==80) begin
				$display("Simulation 3 succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation 3 failed");
				$display(Result);
		end
		#10;
		
		//TEST4
		A[0]=2010; A[1]=300; A[2]=350;
		B[0]=-10; B[1]=300; B[2]=-400;
		Operation = 3'b011;
		if(Result==0) begin
				$display("Simulation 4 succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation 4 failed");
				$display(Result);
		end
		#10;
		
		//TEST5
		A[0]=2010; A[1]=300; A[2]=350;
		B[0]=-10; B[1]=300; B[2]=-400;
		Operation = 3'b100;
		if(Result==0) begin
				$display("Simulation 5 succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation 5 failed");
				$display(Result);
		end
		
	end
	
	
endmodule