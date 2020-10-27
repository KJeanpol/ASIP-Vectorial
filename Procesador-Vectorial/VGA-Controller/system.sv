//`timescale 1 ps / 1 ns
module system(input logic clk,
              input logic reset,
              output logic vsync,
              output logic hsync,
				  output logic blank,
				  output logic sync,
				  output logic [7:0] r,
				  output logic [7:0] g,
				  output logic [7:0] b,
				  output logic vga_clk);

		
	logic clk25 = 0;
	logic bounds_draw;

	logic [9:0] hcount,vcount;
	logic [9:0] X,Y;
	
	logic [7:0]color;
	
	always @(posedge clk) begin
		if(clk == 1'b1)
		begin
			clk25 = ~clk25;

		end
	end

	draw  #(640,480)Draw (hcount, vcount, bounds_draw);

	
	
	imageDrawer #(640) drawer(clk,bounds_draw,hcount,vcount, color);
	//imem Imem(hcount,vcount,color);
	
	//assign color = 8'b1111111;
	//VGA_Controller vga (color,color,color,r,g,b,hsync,vsync,sync,blank,vga_clk,clk25,reset,hcount,vcount);
	assign blank = 1;
	assign sync = 0;
	vga_contollerTest vgaTest (clk25,color,color,color,hcount,vcount,vsync,hsync,r,g,b,vga_clk);
	


endmodule
