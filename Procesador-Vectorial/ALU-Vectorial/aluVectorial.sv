module aluVectorial #(parameter N=18, parameter V=3) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [2:0] C,
					 output logic [V-1:0] [N-1:0] R,
					 output logic [3:0] F); //Overflow,carry,zero,negative
	
	logic [V-1:0][N:0] result;
	
	always_comb 
	begin 
		
		case(C)
			3'b000: //Add
				begin
					result[0] = A[0]+B[0];
					result[1] = A[1]+B[1];
					result[2] = A[2]+B[2];
				end
			3'b001: //Sub
				begin
				 result[0] = A[0]-B[0];
				 result[1] = A[1]-B[1];
				 result[2] = A[2]-B[2];
				end
			3'b010: //AND
				begin
				 result[0] = A[0]&B[0];
				 result[1] = A[1]&B[1];
				 result[2] = A[2]&B[2];
				end
			3'b011: //OR
				begin
				 result[0] = A[0]|B[0];
				 result[1] = A[1]|B[1];
				 result[2] = A[2]|B[2];
				end
			3'b100: //MUL
				begin
				 result[0] = A[0]*B[0];
				 result[1] = A[1]*B[1];
				 result[2] = A[2]*B[2];
				end
			3'b101: //CONV
				begin
				 result[0] = A[0]+B[0];
				 result[1] = A[1]+B[1];
				 result[2] = A[2]+B[2];
				end
		endcase 
		
		R[0]=result[0][N-1:0];
		R[1]=result[1][N-1:0];
		R[2]=result[2][N-1:0];

		F[3]=result[V-1][N-1]; //Negative unicamente para el mas significativo 
		
		F[1]=result[V-1][N]; //Carry unicamente para el mas significativo 
		F[0]=0; //To fix later
		
		/*always_comb begin
			case (F[2:1])
				2'b01: F[0] <= A[V-1][N-1] & (B[V-1][N-1] & ~R[V-1][N-1] | ~A[V-1][N-1] & ~B[V-1][N-1] & R[V-1][N-1]);
				2'b11: F[0] <= ~A[V-1][N-1] & (B[V-1][N-1] & R[V-1][N-1] | A[V-1][N-1] & ~B[V-1][N-1] & ~R[V-1][N-1]);
				default: F[0] <= 1'b0;
			endcase
		end*/
		
		if(result==0) //Zero
			F[2]=1;
		else
			F[2]=0;

	end

endmodule 