module DecodeTB ();

	logic clk, RegWriteW,ImmSrcD;
    logic [31:0] Instr;
    logic [2:0][17:0] wd3;
    logic [3:0] wa3w;
    logic [2:0] RegSrc;
    logic [2:0][17:0] rd1, rd2;
    logic [2:0][17:0] ExtImm;
    logic [3:0] ra1, ra2;

    Decode uut(clk, RegWriteW,ImmSrcD,Instr,wd3,wa3w,RegSrc,rd1, rd2,ExtImm, ra1, ra2);

	initial begin
	RegWriteW = 1'b0;
	ImmSrcD = 1'b0;
	RegSrc = 3'b000;
	Instr = 32'b11100000100000010010000000000011;//Add r2,r1,r3
	
	clk = 1'b0;#10;
	clk = 1'b1;#10;

	wa3w = 4'b0001;
	wd3[0] = 18'b101010101010101010;
	wd3[1] = 18'b111111111111111111;
	wd3[2] = 18'b100000000000000000;

	clk = 1'b0;#100;
	clk = 1'b1;#100;

	wa3w = 4'b0011;
	wd3[0] = 18'b101011111111111010;
	wd3[1] = 18'b111000000111111111;
	wd3[2] = 18'b101010101000000010;

	clk = 1'b0;#100;
	clk = 1'b1;#100;

	RegWriteW = 1'b1;


	clk = 1'b0;#100;
	clk = 1'b1;#100;

	wa3w = 4'b0001;
	wd3[0] = 18'b101010101010101010;
	wd3[1] = 18'b111111111111111111;
	wd3[2] = 18'b100000000000000000;

	clk = 1'b0;#100;
	clk = 1'b1;#100;

	wa3w = 4'b0011;
	wd3[0] = 18'b101011111111111010;
	wd3[1] = 18'b111000000111111111;
	wd3[2] = 18'b101010101000000010;

	clk = 1'b0;#100;
	clk = 1'b1;#100;

	end

endmodule