module WriteBack #(parameter N=20)(
    input logic [7:0] [N-1:0] ALUOutW, ReadDataW,
    input logic MemtoRegW,
    output logic [7:0] [N-1:0] ResultW
);
    mux_2to1 #(20) mux2to1WB(ALUOutW, ReadDataW, MemtoRegW,ResultW); 
    
endmodule
