module WriteBack #(parameter N=16)(
    input logic [15:0] [N-1:0] ALUOutW, ReadDataW,
    input logic MemtoRegW,
    output logic [15:0] [N-1:0] ResultW
);
    VecMux2_1 #(16,16) muxWB(ALUOutW, ReadDataW, MemtoRegW,ResultW); 
    
endmodule
