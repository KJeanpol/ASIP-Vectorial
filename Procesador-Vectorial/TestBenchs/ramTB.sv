`timescale 1ns / 1ps
module ramTB();

	logic clk;
	logic [7:0] data = 8'b0;
    logic [5:0] read_addr = 6'b0;
    logic [5:0] write_addr = 6'b0;
    logic write_enable = 1'b0;
	logic [7:0] output_q;	 
	 
 //ramHistogram uut(clk,data,read_addr,write_addr,write_enable,output_q);
 ram1 uut(clk,data,read_addr,write_addr,write_enable,output_q);
	always begin
	    clk <= 1; #5; clk <= 0; #5;
    end
						
    initial begin		
		read_addr <= 6'b00;
        #10;
        
		read_addr <= 6'b01;
        #10;

        //Writing
        write_enable <=1'b1;
        data<=8'b1;
        write_addr <= 6'b0;
        #10;

        data<=8'b10;
        write_addr <= 6'b1;
        #10;

        data<=8'b11;
        write_addr <= 6'b10;
        #10;

        //Reading
        write_enable <=1'b0;
        read_addr <= 6'b00;
        #10;
        read_addr <= 6'b1;
        #10;
		read_addr <= 6'b10;
        #10;

    end


endmodule