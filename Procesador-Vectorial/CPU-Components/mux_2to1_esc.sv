module mux_2to1_esc ( input logic [8:0] a,                 
    input logic [8:0 ]b,                                 
    input logic sel,             
    output reg [8:0] out);         

always @ (a or b or sel) begin
case (sel)
1'b0 : out <= a;
1'b1 : out <= b;
endcase
end
endmodule