module WriteBack #(parameter N=32)(
    input logic [15:0] [N-1:0] ALUOutW, ReadDataW,
    input logic MemtoRegW,
    output logic [15:0] [N-1:0] ResultW
);
    VecMux2_1 #(8,16) muxWB(ALUOutW, ReadDataW, MemtoRegW,ResultW); 
    
endmodule
