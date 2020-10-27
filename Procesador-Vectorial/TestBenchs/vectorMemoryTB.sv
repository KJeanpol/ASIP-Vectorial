`timescale 1 ps / 1 ps
module vectorMemoryTB();
	logic clk;
	logic vga_clk;
	logic [19:0]addr;
	logic wr_enable;
	logic [7:0] inData;
	logic [7:0][19:0] outData;
	logic [7:0] pixel;

	vectorMemory #(610) uut(clk,vga_clk,addr,wr_enable,inData,outData,pixel);
	
	always begin
	    clk <= 1; #5; clk <= 0; #5;
		 vga_clk <= 0; #5; vga_clk <= 1; #5;
    end
	
	initial begin
		addr<=20'b0;
      wr_enable <=1'b0;
		inData<=8'b0;
		#20;
		addr<=20'b1000000000;
        wr_enable <=1'b0;
		inData<=8'b0;
		#20;
		addr<=20'b10000001000000000;
        wr_enable <=1'b0;
		inData<=8'b0;
		#20;
		addr<=20'b100000001000000000;
        wr_enable <=1'b0;
		inData<=8'b0;
		#20;
		addr<=20'b110000001000000000;
        wr_enable <=1'b0;
		inData<=8'b0;
		#20;
		addr<=20'b1000000001000000000;
        wr_enable <=1'b0;
		inData<=8'b0;
		#20;
	end

endmodule
