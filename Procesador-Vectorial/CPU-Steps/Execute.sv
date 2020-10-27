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
    
    mux_3to1 #(20) muxAlu1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
    mux_2to1 mux2to1Alu(SrcA1, Zeros, ALUSrcE[0], SrcAE); 
    mux_3to1 #(20) muxAlu2(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
    mux_2to1 #(20) muxAlu3(writeDataE, ExtImmE, ALUSrcE[1], SrcBE); 

    aluMain #(20, 8) alu(SrcAE, SrcBE, ALUControlE, AluResultE);

endmodule
