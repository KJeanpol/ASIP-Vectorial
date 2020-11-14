module WriteBack #(parameter N=20)(
    input logic [7:0] [N-1:0] ALUOutW, ReadDataW,
    input logic MemtoRegW,
    output logic [7:0] [N-1:0] ResultW
);
    VecMux2_1 #(20) muxWB(ALUOutW, ReadDataW, MemtoRegW,ResultW); 
    
endmodule
