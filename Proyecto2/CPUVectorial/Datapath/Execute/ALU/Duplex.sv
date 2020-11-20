module Duplex #(parameter N=16, parameter V=16) 
					(input logic [V-1:0][N-1:0] A,
					 output logic [V-1:0] [N-1:0] Result
					); 

	
	assign Result[0]=A[0];
	assign Result[1]=A[0];
	assign Result[2]=A[1];
 	assign Result[3]=A[1];
	assign Result[4]=A[2];
	assign Result[5]=A[2];
	assign Result[6]=A[3];
	assign Result[7]=A[3];
	assign Result[8]=A[4];
	assign Result[9]=A[4];
	assign Result[10]=A[5];
	assign Result[11]=A[5];
	assign Result[12]=A[6];
	assign Result[13]=A[6];
	assign Result[14]=A[7];
	assign Result[15]=A[7];
	
endmodule