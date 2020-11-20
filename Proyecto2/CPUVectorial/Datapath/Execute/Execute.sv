module Execute#(parameter N=16)(
    input logic [15:0] [N-1:0] rd1E, rd2E, ResultW, ALUResultM, ExtImmE,
    input logic [1:0] ForwardAE, ForwardBE, ALUSrcE,
    input logic [2:0] ALUControlE,
    output logic [15:0] [N-1:0] writeDataE, AluResultE
);
    logic [15:0] [N-1:0] Zeros, SrcA1, SrcAE, SrcBE;
    assign Zeros[0] = 16'b0;
    assign Zeros[1] = 16'b0;
    assign Zeros[2] = 16'b0;
    assign Zeros[3] = 16'b0;
    assign Zeros[4] = 16'b0;
    assign Zeros[5] = 16'b0;
    assign Zeros[6] = 16'b0;
    assign Zeros[7] = 16'b0;
	 assign Zeros[8] = 16'b0;
    assign Zeros[9] = 16'b0;
    assign Zeros[10] = 16'b0;
    assign Zeros[11] = 16'b0;
    assign Zeros[12] = 16'b0;
    assign Zeros[13] = 16'b0;
    assign Zeros[14] = 16'b0;
    assign Zeros[15] = 16'b0; 
    
     
	 VecMux2_1 #(16,16) muxSrcB(writeDataE, ExtImmE, ALUSrcE[1], SrcBE);
	 VecMux3_1 #(16,16) muxSrcA1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
    VecMux3_1 #(16,16) muxWDE(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
     
	 VecMux2_1 #(16,16) muxSrcA(SrcA1, Zeros, ALUSrcE[0], SrcAE);
	 
    VecALU #(16, 16) alu(SrcAE, SrcBE, ALUControlE, AluResultE);

endmodule
