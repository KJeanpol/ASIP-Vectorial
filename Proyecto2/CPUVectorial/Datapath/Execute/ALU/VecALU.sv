module VecALU #(parameter N=20, parameter V=8) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [2:0] Op,
					 output logic [V-1:0] [N-1:0] Result
					); 

	logic [V-1:0][N-1:0] resultado;
	
	ScalarALU #(20) alu1(A[0], B[0], Op, resultado[0]);
	ScalarALU #(20) alu2(A[1], B[1], Op, resultado[1]);
 	ScalarALU #(20) alu3(A[2], B[2], Op, resultado[2]);
 	ScalarALU #(20) alu4(A[3], B[3], Op, resultado[3]);
	ScalarALU #(20) alu5(A[4], B[4], Op, resultado[4]);
 	ScalarALU #(20) alu6(A[5], B[5], Op, resultado[5]);
 	ScalarALU #(20) alu7(A[6], B[6], Op, resultado[6]);
	ScalarALU #(20) alu8(A[7], B[7], Op, resultado[7]);

 	assign Result[0] = resultado[0];
 	assign Result[1] = resultado[1];
 	assign Result[2] = resultado[2];
 	assign Result[3] = resultado[3];
 	assign Result[4] = resultado[4];
 	assign Result[5] = resultado[5];
 	assign Result[6] = resultado[6];
 	assign Result[7] = resultado[7];

 	
	
endmodule