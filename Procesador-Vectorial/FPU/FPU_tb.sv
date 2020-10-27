

`timescale 1 ps / 1 ps

module FPU_tb();

	logic CLK;
	logic enable;
	logic [31:0] A, B;
	logic [1:0] opcode;
	logic reset;
	logic ready;
	logic [31:0] O;
	
	
	FPU DUT( .CLK(CLK),
				.enable(enable),
				.A(A),
				.B	(B),
				.opcode(opcode),
				.reset(reset),
				.ready(ready),
				.O(O)
				);

	
	
	initial 
		begin
	
		A = 32'b01000001010100000000000000000000; B = 32'b01000010100011000000000000000000; reset=1 ; enable=1; opcode = 2'b00; #20;
		assert (O === 32'b01000010101001100000000000000000) else $error("fail");
		
		A = 32'b0; B = 32'b0; reset=1 ; enable=0; opcode = 2'b00; #20;
		//reset	with -enable
		
		A = 32'b01000001010100000000000000000000; B = 32'b11000010100011000000000000000000; reset=1 ; enable=1; opcode = 2'b00; #20;
		assert (O === 32'b11000010011001000000000000000000) else $error("fail");
		
		A = 32'b0; B = 32'b0; reset=1 ; enable=0; opcode = 2'b00; #20;
		//reset	with -enable
		
		A = 32'b01000001011100000000000000000000; B = 32'b11000010010100000000000000000000; reset=1 ; enable=1; opcode = 2'b11; #20;
		assert (O === 32'b11000100010000110000000000000000) else $error("fail");	
		
		A = 32'b0; B = 32'b0; reset=1 ; enable=0; opcode = 2'b00; #20;
		//reset	with -enable
	
		A = 32'b01000000110000000000000000000000; B = 32'b01000000000000000000000000000000; reset=1 ; enable=1; opcode = 2'b10; #170;
		assert (O === 32'b01000000010000000000000000000000) else $error("fail");
		
		A = 32'b0; B = 32'b0; reset=1 ; enable=0; opcode = 2'b00; #20;
		
		A = 32'b01000001010100000000000000000000; B = 32'b01000010100011000000000000000000; reset=1 ; enable=1; opcode = 2'b00; #20;
		assert (O === 32'b01000010101001100000000000000000) else $error("fail");
		
		//A = 32'b01000000110000000000000000000000; B = 32'b01000000000000000000000000000000; reset=0 ; enable=1; opcode = 2'b10; #20;
		//assert (O === 32'b01000000010000000000000000000000) else $error("fail");
	
	end
	
	
	
	always 
		begin 
			CLK <= 1; #5;		
			CLK <= 0; #5;
		end 
      
	
	

endmodule