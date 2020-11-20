module ScalarALU #(parameter N=16)(input logic [N-1:0] A, B,
 				 input logic [2:0] F,
				 output logic [N-1:0] Result
				 );
	always_comb
		case (F[2:0])
			3'b000: Result <= A + B;  //add
			3'b001: Result <= (A>B)?(A-B):(A-B); //sub
			3'b010: Result <= B; 	 //mov
			3'b011: Result <= A*B; 	 //mul
			3'b100: Result <= A/B;   //div
			3'b101: Result <= A<B ? (A>0 ? A:B) : B;  //cmp
			default: Result <= B; //A*B; 
		endcase
	
endmodule