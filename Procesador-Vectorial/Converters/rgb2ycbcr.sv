/**
* RGB 和 YCbCr 高精度互转 精度可以控制，告别 8bit 256 时代。 算法全是用 乘符号 ‘*’ ，没有用DA的方式，更方便阅读。
*/

module rgb2ycbcr #(
	parameter	DSIZE	= 8,
	parameter	MSIZE	= 12
)(
	input				clock  		,
	input [DSIZE-1:0]	inR         ,
	input [DSIZE-1:0]	inG         ,
	input [DSIZE-1:0]	inB         ,
	output[DSIZE-1:0]	outY        ,
	output[DSIZE-1:0]	outCb       ,
	output[DSIZE-1:0]	outCr
);


localparam [MSIZE-1:0]	  	M00p0_257		= 0.257 * 2**MSIZE,
							M10n0_148		= 0.148 * 2**MSIZE,
							M20p0_439       = 0.439 * 2**MSIZE;

localparam [MSIZE-1:0]		M01p0_504		= 0.504 * 2**MSIZE,
							M11n0_291		= 0.291 * 2**MSIZE,
							M21n0_368		= 0.368 * 2**MSIZE;

localparam [MSIZE-1:0]		M20p0_098		= 0.098 * 2**MSIZE,
							M21p0_439		= 0.439 * 2**MSIZE,
							M22n0_071		= 0.071 * 2**MSIZE;

reg [DSIZE+MSIZE-1:0]	Rxp0_257,Rxn0_148,Rxp0_439;

always@(posedge clock)begin
	Rxp0_257	<= inR * M00p0_257;
	Rxn0_148	<= inR * M10n0_148;
	Rxp0_439	<= inR * M20p0_439;
end

reg [DSIZE+MSIZE-1:0]	Gxp0_504,Gxn0_291,Gxn0_368;

always@(posedge clock)begin
	Gxp0_504	<= inG * M01p0_504;
	Gxn0_291	<= inG * M11n0_291;
	Gxn0_368	<= inG * M21n0_368;
end

reg [DSIZE+MSIZE-1:0]	Bxp0_098,Bxp0_439,Bxn0_071;

always@(posedge clock)begin
	Bxp0_098	<= inB * M20p0_098;
	Bxp0_439	<= inB * M21p0_439;
	Bxn0_071	<= inB * M22n0_071;
end

reg [DSIZE-1:0]	Rxp0_257__Gxp0_504;
reg [DSIZE-1:0]	Rxn0_148__Gxn0_291;
reg [DSIZE-1:0]	Gxn0_368__Bxn0_071;

reg [DSIZE-1:0]	Bxp0_098__16;
reg [DSIZE-1:0]	Bxp0_439__128;
reg [DSIZE-1:0]	Rxp0_439__128;

always@(posedge clock)begin
	Rxp0_257__Gxp0_504	<= Rxp0_257[DSIZE+MSIZE-1-:DSIZE] + Gxp0_504[DSIZE+MSIZE-1-:DSIZE];
	Rxn0_148__Gxn0_291	<= Rxn0_148[DSIZE+MSIZE-1-:DSIZE] + Gxn0_291[DSIZE+MSIZE-1-:DSIZE];
	Gxn0_368__Bxn0_071	<= Gxn0_368[DSIZE+MSIZE-1-:DSIZE] + Bxn0_071[DSIZE+MSIZE-1-:DSIZE];

	Bxp0_098__16		<= Bxp0_098[DSIZE+MSIZE-1-:DSIZE] + (2**DSIZE)/16;
	Bxp0_439__128		<= Bxp0_439[DSIZE+MSIZE-1-:DSIZE] + (2**DSIZE)/2;
	Rxp0_439__128		<= Rxp0_439[DSIZE+MSIZE-1-:DSIZE] + (2**DSIZE)/2;
end

reg [DSIZE-1:0]	Rxp0_257__Gxp0_504___Bxp0_098__16;
reg [DSIZE-1:0]	Rxn0_148__Gxn0_291___Bxp0_439__128;
reg [DSIZE-1:0]	Gxn0_368__Bxn0_071___Rxp0_439__128;

always@(posedge clock)begin
	Rxp0_257__Gxp0_504___Bxp0_098__16	<= Rxp0_257__Gxp0_504 	+ Bxp0_098__16;
	Rxn0_148__Gxn0_291___Bxp0_439__128	<= Bxp0_439__128		- Rxn0_148__Gxn0_291;
	Gxn0_368__Bxn0_071___Rxp0_439__128	<= Rxp0_439__128		- Gxn0_368__Bxn0_071;
end    


assign	outY  		=  Rxp0_257__Gxp0_504___Bxp0_098__16; 
assign	outCb       =  Rxn0_148__Gxn0_291___Bxp0_439__128;
assign	outCr       =  Gxn0_368__Bxn0_071___Rxp0_439__128; 

endmodule


`timescale 1ns / 1ps
module rgb2YCbCrTB();

	logic clk;
	logic [7:0] VGA_R;	
	logic [7:0] VGA_G;	
	logic [7:0] VGA_B;
	logic [7:0] Y;	
	logic [7:0] Cb;	
	logic [7:0] Cr;

	rgb2ycbcr uut(clk,VGA_R,VGA_G,VGA_B,Y,Cb,Cr);
	
	always begin
			clk <= 1; #5; clk <= 0; #5;
	end
	
	initial begin
	

	VGA_R = 8'b01111101; //125
	VGA_G = 8'b11001000;	//200
	VGA_B = 8'b11111010; //250
	
	end 

endmodule





