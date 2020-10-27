module aluMain_tb();
	
	logic clk,reset;
	logic [7:0][19:0] A, B, Result;
	logic [2:0] Operation;

	
	// instantiate device to be tested
	aluMain #(20, 8) dut(A, B, Operation, Result);

	initial begin
		reset <= 1; #5; reset <=0;
	end
	
	always begin
		clk <=1; #5; clk<=0; #5;
	end
	
	//RADIX -> UNSIGNED
	
	always @(posedge clk)
	begin
		//ADD
		A[0]<=100; A[1]<=254; A[2]<=251; A[3]<=200; A[4]<=05; A[5]<=10; A[6]<=100; A[7]<=15;
		B[0]<=100; B[1]<=1; B[2]<=1; B[3]<=45; B[4]<=25; B[5]<=1; B[6]<=2; B[7]<=10; 
		Operation = 3'b000;
		#10;
		if(Result[0]==200 && Result[1]==255 && Result[2]==252 && Result[3]==245 && Result[4]==30 && Result[5]==11 && Result[6]==102 && Result[7]==25) begin
				$display("Simulation [ADD] succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation [ADD] failed");
				$display(Result);
		end
		
		//SUB
		A[0]<=100; A[1]<=255; A[2]<=251; A[3]<=200; A[4]<=25; A[5]<=10; A[6]<=100; A[7]<=15;
		B[0]<=100; B[1]<=55; B[2]<=1; B[3]<=45; B[4]<=05; B[5]<=1; B[6]<=2; B[7]<=10; 
		Operation = 3'b001;
		#10;
		if(Result[0]==0 && Result[1]==200 && Result[2]==250 && Result[3]==155 && Result[4]==20 && Result[5]==9 && Result[6]==98 && Result[7]==5) begin
				$display("Simulation [SUB] succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation [SUB] failed");
				$display(Result);
		end
	
		
		//MOV
		A[0]<=100; A[1]<=255; A[2]<=251; A[3]<=200; A[4]<=25; A[5]<=10; A[6]<=100; A[7]<=15;
		Operation = 3'b010;
		#10;
		if(Result[0]==100 && Result[1]==255 && Result[2]==251 && Result[3]==200 && Result[4]==25 && Result[5]==10 && Result[6]==100 && Result[7]==15) begin
				$display("Simulation [MOV] succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation [MOV] failed");
				$display(Result);
		end
		
		#10;
		//MUL
		A[0]<=2; A[1]<=6; A[2]<=10; A[3]<=15; A[4]<=4; A[5]<=8; A[6]<=25; A[7]<=50;
		B[0]<=2; B[1]<=2; B[2]<=20; B[3]<=2; B[4]<=5; B[5]<=5; B[6]<=2; B[7]<=2; 
		Operation = 3'b011;
		#10;
		if(Result[0]==4 && Result[1]==12 && Result[2]==200 && Result[3]==30 && Result[4]==20 && Result[5]==40 && Result[6]==50 && Result[7]==100) begin
				$display("Simulation [MUL] succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation [MUL] failed");
				$display(Result);
		end
		#10;
		//DIV
		A[0]<=2; A[1]<=6; A[2]<=10; A[3]<=15; A[4]<=200; A[5]<=8; A[6]<=25; A[7]<=50;
		B[0]<=2; B[1]<=2; B[2]<=2; B[3]<=2; B[4]<=100; B[5]<=4; B[6]<=5; B[7]<=2; 
		Operation = 3'b100;
		#10;
		if(Result[0]==1 && Result[1]==3 && Result[2]==5 && Result[3]==7 && Result[4]==2 && Result[5]==2 && Result[6]==5 && Result[7]==25) begin
				$display("Simulation [DIV] succeeded");
				$display(Result);
		end 
		else begin 
				$display("Simulation [DIV] failed");
				$display(Result);
		end
		#10;
		
		
	end
	
	
endmodule