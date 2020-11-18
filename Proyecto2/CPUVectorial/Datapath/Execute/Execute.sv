module Execute#(parameter N=8)(
    input logic [15:0] [N-1:0] rd1E, rd2E, ResultW, ALUResultM, ExtImmE,
    input logic [1:0] ForwardAE, ForwardBE, ALUSrcE,
    input logic [2:0] ALUControlE,
    output logic [15:0] [N-1:0] writeDataE, AluResultE
);
    logic [15:0] [N-1:0] Zeros, SrcA1, SrcAE, SrcBE;
    assign Zeros[0] = 8'b0;
    assign Zeros[1] = 8'b0;
    assign Zeros[2] = 8'b0;
    assign Zeros[3] = 8'b0;
    assign Zeros[4] = 8'b0;
    assign Zeros[5] = 8'b0;
    assign Zeros[6] = 8'b0;
    assign Zeros[7] = 8'b0;
	 assign Zeros[8] = 8'b0;
    assign Zeros[9] = 8'b0;
    assign Zeros[10] = 8'b0;
    assign Zeros[11] = 8'b0;
    assign Zeros[12] = 8'b0;
    assign Zeros[13] = 8'b0;
    assign Zeros[14] = 8'b0;
    assign Zeros[15] = 8'b0; 
    
     
	 VecMux2_1 #(8,16) muxSrcB(writeDataE, ExtImmE, ALUSrcE[1], SrcBE);
	 VecMux3_1 #(8,16) muxSrcA1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
    VecMux3_1 #(8,16) muxWDE(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
     
	 VecMux2_1 #(8,16) muxSrcA(SrcA1, Zeros, ALUSrcE[0], SrcAE);
	 
    VecALU #(8, 16) alu(SrcAE, SrcBE, ALUControlE, AluResultE);

endmodule
