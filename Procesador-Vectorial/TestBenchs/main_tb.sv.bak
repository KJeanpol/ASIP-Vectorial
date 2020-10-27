`timescale 1 ps / 1 ps

module main_tb();
			  
logic clk;
logic reset;
logic vsync;
logic hsync;
logic blank;
logic sync;
logic [7:0] r;
logic [7:0] g;
logic [7:0] b;
logic vga_clk;
logic kernel1, kernel2,kernel3;
logic identity;


main dut (clk,reset,kernel1, kernel2,kernel3,identity,vsync,hsync,blank,sync,r,g,b,vga_clk);

initial begin
	clk=0; reset=1;
	#15;
	reset=0;
	kernel1=1;
	kernel2=0;
	kernel3=0;
	identity=0;
	
end
always begin 
	#2 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
end
	initial
	#16000 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule 