module DataPath #(parameter N=16)(
    input logic CLK, RST, CLR2, EN1, EN2, RegWriteD, MemtoRegD, MemWriteD,
    input logic [2:0] ALUControlD,
    input logic [1:0] ImmSrcD, ALUSrcD,
    input logic [31:0] InstrF,
    input logic [15:0][N-1:0] RDM,
    input logic [1:0] ForwardAE,
    input logic [1:0] ForwardBE,
	 input logic [1:0] RegSrc,
    output logic [31:0] PC,
    output logic [15:0][N-1:0] writeDataM,
    output logic MemWriteM,
    output logic [3:0] ra1D, ra2D, ra1E, ra2E,
    output logic [3:0] WA3E, WA3M, WA3W,
    output logic RegWriteM, RegWriteW,
    output logic MemtoRegE,
    output logic [31:0] InstrD,
    output logic [15:0][N-1:0] ALUResultM
);

    logic RegWriteE, MemWriteE, MemtoRegM, MemtoRegW;
    logic [1:0] ALUSrcE;
    logic [2:0] ALUControlE;
    logic [15:0] [N-1:0] rd1, rd2, ExtImm, ExtImmE, ResultW, rd1E, rd2E, writeDataE, AluResultE, ReadDataW, ALUOutW; 

    //Fetch
    Fetch fetch(CLK, RST, EN1, PC);
	 
    //FetchPipe
    FetchPipe fetchPipe(InstrF, CLK, 1'b0, EN2, InstrD);
    
	 //Decode
    Decode decode(CLK, RST, RegWriteW, ImmSrcD, InstrD, ResultW, WA3W, RegSrc, rd1, rd2, ExtImm, ra1D, ra2D); 

    //DecodePipe
    DecodePipe #(16) decodePipe(rd1, rd2, ra1D, ra2D, ExtImm, CLK, CLR2, 1'b1, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, ALUControlD, InstrD[7:4], rd1E, rd2E, ra1E, ra2E, ExtImmE, RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, ALUControlE, WA3E); 
   
	 //Execute                     
    Execute execute(rd1E, rd2E, ResultW, ALUResultM, ExtImmE, ForwardAE, ForwardBE, ALUSrcE, ALUControlE, writeDataE, AluResultE);               

    //ExecutePipe
    ExecutePipe executePipe(AluResultE, writeDataE, WA3E, CLK, 1'b0, 1'b1, RegWriteE, MemtoRegE, MemWriteE, ALUResultM, writeDataM, WA3M, RegWriteM, MemtoRegM, MemWriteM); 

	 //Luego va MEM
	 
    //WriteBackPipe
    WriteBackPipe #(16) wbpipe(RDM, ALUResultM, CLK, 1'b0, 1'b1, WA3M, RegWriteM, MemtoRegM, ReadDataW, RegWriteW, MemtoRegW, WA3W, ALUOutW);

	 //WriteBack
    WriteBack writeback(ALUOutW, ReadDataW, MemtoRegW, ResultW);
	 
endmodule
