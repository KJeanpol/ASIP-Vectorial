module mux_2to1 #(parameter N=20)( input [7:0][N-1:0] a,                 
    input [7:0][N-1:0] b,                                 
    input logic sel,             
    output reg [7:0][N-1:0] out);         

always @ (a or b or sel) begin
case (sel)
8'b0 : out <= a;
8'b1 : out <= b;
endcase
end
endmodule