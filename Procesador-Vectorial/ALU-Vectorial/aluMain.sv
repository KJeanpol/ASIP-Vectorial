module aluMain #(parameter N=20, parameter V=8) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [2:0] Operation,
					 output logic [V-1:0] [N-1:0] Result
					); 

	logic [V-1:0][N-1:0] resultALU;
	
	aluScalar #(20) alu1(A[0], B[0], Operation, resultALU[0]);
	aluScalar #(20) alu2(A[1], B[1], Operation, resultALU[1]);
 	aluScalar #(20) alu3(A[2], B[2], Operation, resultALU[2]);
 	aluScalar #(20) alu4(A[3], B[3], Operation, resultALU[3]);
	aluScalar #(20) alu5(A[4], B[4], Operation, resultALU[4]);
 	aluScalar #(20) alu6(A[5], B[5], Operation, resultALU[5]);
 	aluScalar #(20) alu7(A[6], B[6], Operation, resultALU[6]);
	aluScalar #(20) alu8(A[7], B[7], Operation, resultALU[7]);



 	assign Result[0] =  resultALU[0];
 	assign Result[1] =  resultALU[1];
 	assign Result[2] =  resultALU[2];
 	assign Result[3] =  resultALU[3];
 	assign Result[4] =  resultALU[4];
 	assign Result[5] =  resultALU[5];
 	assign Result[6] =  resultALU[6];
 	assign Result[7] =  resultALU[7];

 	
	
endmodule