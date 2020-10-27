`timescale 1ns / 1ps
module ramTB2();

	logic clk;
	logic [127:0] data = 128'b0;
   logic [15:0] r_addr = 16'b0;
	logic [15:0] w_addr = 16'b0;
   logic write_enable = 1'b0;
	logic [127:0] output_q= 128'b0;	 
	 
	ramImage1 uut(clk,data,r_addr,w_addr,write_enable,output_q);

	always begin
	    clk <= 1; #5; clk <= 0; #5;
    end
						
    initial begin		
		r_addr <= 16'b00;
      #15;
        
		r_addr <= 16'b01;
      #15;
		r_addr <= 16'b10;
      #15;
        
		r_addr <= 16'b11;
      #15;
		r_addr <= 16'b100;
      #15;
        
		r_addr <= 16'b101;
      #15;
		r_addr <= 16'b110;
      #15;
        
		r_addr <= 16'b111;
      #15;

  

    end


endmodule