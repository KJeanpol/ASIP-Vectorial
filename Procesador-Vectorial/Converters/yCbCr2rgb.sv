/**
* RGB 和 YCbCr 高精度互转 精度可以控制，告别 8bit 256 时代。 算法全是用 乘符号 ‘*’ ，没有用DA的方式，更方便阅读。
*/
module yCbCr2rgb #(
	parameter	DSIZE	= 8,
	parameter	MSIZE	= 12
)(
	input				clock  		,
	input [DSIZE-1:0]	inY         ,
	input [DSIZE-1:0]	inCb        ,
	input [DSIZE-1:0]	inCr        ,
	output[DSIZE-1:0]	outR        ,
	output[DSIZE-1:0]	outG        ,
	output[DSIZE-1:0]	outB
);

localparam [MSIZE+1:0]	Mp1_164		= 1.164		* 2**MSIZE	,
						Mp1_596 	= 1.596		* 2**MSIZE	,
						Mn0_392		= 0.392		* 2**MSIZE  ,
						Mn0_813		= 0.813		* 2**MSIZE  ,
						Mp2_017		= 2.017		* 2**MSIZE  ;

localparam [DSIZE-1:0]	Mn222_912	= 222.912	* 2**(DSIZE-8)	,
						Mp135_616	= 135.616	* 2**(DSIZE-8)  ;
localparam [DSIZE:0]	Mn276_800	= 276.800	* 2**(DSIZE-8) 	;

reg [DSIZE+MSIZE-1:0]	Yp1_164;
reg [DSIZE+MSIZE-1:0]	Crp1_596;
reg [DSIZE+MSIZE-1:0]	Crn0_813;
reg [DSIZE+MSIZE-1:0]	Cbn0_392;
reg [DSIZE+MSIZE-1:0]	Cbp2_017;

always@(posedge clock)begin
	Yp1_164		<= inY	* Mp1_164[MSIZE:1];
	Crp1_596	<= inCr	* Mp1_596[MSIZE:1];
	Crn0_813	<= inCr	* Mn0_813[MSIZE-1:0];
	Cbn0_392	<= inCb	* Mn0_392[MSIZE-1:0];
	Cbp2_017	<= inCb	* Mp2_017[MSIZE+1:2];
end

reg [DSIZE+1:0]	Yp1_164__Crp1_596;
reg [DSIZE:0]	Yp1_164__Mp135_616;
reg [DSIZE:0]	Cbn0_392__Crn0_813;
reg [DSIZE+1:0]	Yp1_164__Cbp2_017;

always@(posedge clock)begin
	Yp1_164__Crp1_596	<= Yp1_164[DSIZE+MSIZE-1-:(DSIZE+1)] + Crp1_596[DSIZE+MSIZE-1-:(DSIZE+1)];
	Yp1_164__Mp135_616	<= Yp1_164[DSIZE+MSIZE-1-:(DSIZE+1)] + Mp135_616;
	Cbn0_392__Crn0_813	<= Cbn0_392[DSIZE+MSIZE-1-:DSIZE]+ Crn0_813[DSIZE+MSIZE-1-:DSIZE];
	Yp1_164__Cbp2_017	<= Yp1_164[DSIZE+MSIZE-1-:(DSIZE+1)] + Cbp2_017[DSIZE+MSIZE-1-:(DSIZE+2)]; 
end

reg [DSIZE+1:0]	Yp1_164__Crp1_596__Mn222_912;
reg [DSIZE+1:0]	Yp1_164__Mp135_616___Cbn0_392__Crn0_813;
reg [DSIZE+1:0]	Yp1_164__Cbp2_017__Mn276_800;

always@(posedge clock)begin
	Yp1_164__Crp1_596__Mn222_912			<= Yp1_164__Crp1_596 	- Mn222_912;
	Yp1_164__Mp135_616___Cbn0_392__Crn0_813	<= Yp1_164__Mp135_616 	- Cbn0_392__Crn0_813;
	Yp1_164__Cbp2_017__Mn276_800			<= Yp1_164__Cbp2_017	- Mn276_800; 
end

reg [DSIZE-1:0]	R_reg,G_reg,B_reg;

always@(posedge clock)
	if(Yp1_164__Crp1_596__Mn222_912[DSIZE+1])
			R_reg	<=		{DSIZE{1'b0}};
	else if(Yp1_164__Crp1_596__Mn222_912[DSIZE])
			R_reg	<= 		{DSIZE{1'b1}};
	else	R_reg	<= 		Yp1_164__Crp1_596__Mn222_912[DSIZE-1:0];

always@(posedge clock)
	if(Yp1_164__Mp135_616___Cbn0_392__Crn0_813[DSIZE+1])
			G_reg	<=		{DSIZE{1'b0}};
	else if(Yp1_164__Mp135_616___Cbn0_392__Crn0_813[DSIZE])
			G_reg	<= 		{DSIZE{1'b1}};
	else	G_reg	<= 		Yp1_164__Mp135_616___Cbn0_392__Crn0_813[DSIZE-1:0];

always@(posedge clock)
	if(Yp1_164__Cbp2_017__Mn276_800[DSIZE+1])
			B_reg	<=		{DSIZE{1'b0}};
	else if(Yp1_164__Cbp2_017__Mn276_800[DSIZE])
			B_reg	<= 		{DSIZE{1'b1}};
	else	B_reg	<= 		Yp1_164__Cbp2_017__Mn276_800[DSIZE-1:0];


assign	 outR		=  R_reg	;
assign   outG		=  G_reg	;
assign   outB		=  B_reg	;


endmodule


`timescale 1ns / 1ps
module YCbCr2RGBTB();

	logic clk;
	logic [7:0] Y;	
	logic [7:0] Cb;	
	logic [7:0] Cr;
	logic [7:0] VGA_R;	
	logic [7:0] VGA_G;	
	logic [7:0] VGA_B;


	yCbCr2rgb uut(clk,Y,Cb,Cr,VGA_R,VGA_G,VGA_B);
	
	always begin
			clk <= 1; #5; clk <= 0; #5;
	end
	
	initial begin
	

	Y  = 8'b10101101; //173
	Cb = 8'b10100001;//161
	Cr = 8'b01011011;//91
	
	end 

endmodule
