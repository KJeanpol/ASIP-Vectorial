module VecALU #(parameter N=16, parameter V=16) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [2:0] Op,
					 output logic [V-1:0] [N-1:0] Result
					); 

	logic [V-1:0][N-1:0] resultado;
	logic [V-1:0][N-1:0] resultado2;
	logic sel=0;
	ScalarALU #(8) alu1(A[0], B[0], Op, resultado[0]);
	ScalarALU #(8) alu2(A[1], B[1], Op, resultado[1]);
	ScalarALU #(8) alu3(A[2], B[2], Op, resultado[2]);
	ScalarALU #(8) alu4(A[3], B[3], Op, resultado[3]);
	ScalarALU #(8) alu5(A[4], B[4], Op, resultado[4]);
	ScalarALU #(8) alu6(A[5], B[5], Op, resultado[5]);
	ScalarALU #(8) alu7(A[6], B[6], Op, resultado[6]);
	ScalarALU #(8) alu8(A[7], B[7], Op, resultado[7]);
	ScalarALU #(8) alu9(A[8], B[8], Op, resultado[8]);
	ScalarALU #(8) alu10(A[9], B[9], Op, resultado[9]);
	ScalarALU #(8) alu11(A[10], B[10], Op, resultado[10]);
	ScalarALU #(8) alu12(A[11], B[11], Op, resultado[11]);
	ScalarALU #(8) alu13(A[12], B[12], Op, resultado[12]);
	ScalarALU #(8) alu14(A[13], B[13], Op, resultado[13]);
	ScalarALU #(8) alu15(A[14], B[14], Op, resultado[14]);
	ScalarALU #(8) alu16(A[15], B[15], Op, resultado[15]);
	Duplex dup(A,resultado2);
	

	
	always @ (Op)
	begin
		if (Op==3'b111)
			sel<=1;
		else
			sel<=0;
	end
		
	VecMux2_1 #(16,16) MUX(resultado,resultado2,sel,Result);
 	
	
endmodule