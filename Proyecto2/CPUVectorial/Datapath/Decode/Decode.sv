module Decode #(parameter N=16)(
    input logic clk, RST, RegWriteW, ImmSrcD,
    input logic [31:0] Instr,
    input logic [15:0][N-1:0] wd3,
    input logic [3:0] wa3w,
    input logic [1:0] RegSrc,
    output logic [15:0][N-1:0] rd1, rd2,
    output logic [15:0][N-1:0] ExtImm,
    output logic [3:0] ra1, ra2
    );


n_bit_mux #(4, 1) ra1_mux ({4'b1111, Instr[3:0]}, RegSrc[0], ra1);

n_bit_mux #(4, 1) ra2_mux ({Instr[7:4], Instr[11:8]}, RegSrc[1], ra2);

VecRegFile #(16) registerFile(clk, RST, RegWriteW, ra1, ra2, wa3w, wd3, rd1, rd2);

extendUnit #(16) extend({Instr[1:0],Instr[31:18]}, ExtImm); 



endmodule