module Execute#(parameter N=20)(
    input logic [7:0] [N-1:0] rd1E, rd2E, ResultW, ALUResultM, ExtImmE,
    input logic [1:0] ForwardAE, ForwardBE, ALUSrcE,
    input logic [2:0] ALUControlE,
    output logic [7:0] [N-1:0] writeDataE, AluResultE
);
    logic [7:0] [N-1:0] Zeros, SrcA1, SrcAE, SrcBE;
    assign Zeros[0] = 20'b0;
    assign Zeros[1] = 20'b0;
    assign Zeros[2] = 20'b0;
    assign Zeros[3] = 20'b0;
    assign Zeros[4] = 20'b0;
    assign Zeros[5] = 20'b0;
    assign Zeros[6] = 20'b0;
    assign Zeros[7] = 20'b0; 
    
     
	 VecMux2_1 #(20) muxSrcB(writeDataE, ExtImmE, ALUSrcE[1], SrcBE);
	 VecMux3_1 #(20) muxSrcA1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
    VecMux3_1 #(20) muxWDE(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
     
	 VecMux2_1 muxSrcA(SrcA1, Zeros, ALUSrcE[0], SrcAE);
	 
    VecALU #(20, 8) alu(SrcAE, SrcBE, ALUControlE, AluResultE);

endmodule
