module vectorMemory #(parameter N=20, SIZE=256*256) 
                      (input logic clk,
                      input logic vga_clk,
                       input logic [19:0]addr,
                       input logic wr_enable,
  							  input logic [7:0] inData,
  							  output logic[7:0][N-1:0] outData,
							  output logic[7:0] pixel);

	
  //Histogram
  logic [5:0]  read_address;
  logic [5:0]  write_address;
  logic wr_enable_histogram;
  logic [7:0]  output_histogram;

  //Images
  logic [15:0]  read_address1;
  logic [15:0]  write_address1;
  logic wr_enable_image1;
  logic [7:0]  output_image1;

  logic [15:0]  read_address2;
  logic [15:0]  write_address2;
  logic wr_enable_image2;
  logic [7:0]  output_image2;

  logic [15:0]  read_address3;
  logic [15:0]  write_address3;
  logic wr_enable_image3;
  logic [7:0]  output_image3;

  logic [15:0]  read_address4;
  logic [15:0]  write_address4;
  logic wr_enable_image4;
  logic [7:0]  output_image4;

  logic [15:0]  read_address5;
  logic [15:0]  write_address5;
  logic wr_enable_image5;
  logic [7:0]  output_image5;
  logic [20:0] num=20'b0;
  logic [15:0] cont=16'b0;
  
  logic [7:0] pixel1;
  logic [2:0] enable_pixel1;
  logic [7:0] pixel2;
  logic [2:0] enable_pixel2;
  logic [7:0] pixel3;
  logic [2:0] enable_pixel3;
  logic [7:0] pixel4;
  logic [2:0] enable_pixel4;
  logic [7:0] pixel5;
  logic [2:0] enable_pixel5;
  logic [2:0] memNum;
  
  always_ff@(posedge vga_clk) begin  
    if(num>=SIZE)begin
      cont = 16'b0;
      num = 20'b0;
    end
    else begin
      cont<= num % 17'b10000000000000000;
      if(num<17'b10000000000000000) begin
        pixel<=pixel1;
      end
      else if(num<18'b100000000000000000) begin
        pixel<=pixel2;
      end
      else if(num<18'b110000000000000000) begin
        pixel<=pixel3;
      end
      else if(num<19'b1000000000000000000) begin
        pixel<=pixel4;
      end
      else if(num<19'b1010000000000000000) begin
        pixel<=pixel5;
      end
      else begin
        pixel<=pixel5;
      end
      num <= num + 20'b1;
    end
  end
	
	always_ff@(posedge clk) begin  
    if(addr < 20'b1000000000) begin
      wr_enable_image1 <=1'b0;
      wr_enable_image2 <=1'b0;
      wr_enable_image3 <=1'b0;
      wr_enable_image4 <=1'b0;
      wr_enable_image5 <=1'b0;
      wr_enable_histogram <=wr_enable;
      read_address1 <= addr-16'b0;
      write_address1 <= addr-16'b0;
      read_address2 <= addr-16'b0;
      write_address2 <= addr-16'b0;
      read_address3 <= addr-16'b0;
      write_address3 <= addr-16'b0;
      read_address4 <= addr-16'b0;
      write_address4 <= addr-16'b0;
      read_address5 <= addr-16'b0;
      write_address5 <= addr-16'b0;
	  
      case(wr_enable_histogram)
        1'b1: begin
          write_address<= addr[5:0];
          read_address<= 5'b0;
        end
        1'b0: begin
          write_address<= 5'b0;
          read_address<= addr[5:0];
        end
        default: begin
          write_address<= 5'b0;
          read_address<= addr[5:0];
        end
		  endcase 
    end

    else if(addr >= 20'b1000000000) begin
      wr_enable_histogram <=1'b0;
      write_address<= 6'b0;
      read_address<= 6'b0;
      if(addr >= 20'b1000000000 && 20'b10000001000000000 >addr ) begin //512+65536
        wr_enable_image1 <=wr_enable;
        wr_enable_image2 <=1'b0;
        wr_enable_image3 <=1'b0;
        wr_enable_image4 <=1'b0;
        wr_enable_image5 <=1'b0;
        
        read_address1 <= addr-20'b1000000000;
        write_address1 <= addr-20'b1000000000;
		    read_address2 <= addr-20'b0;
        write_address2 <= addr-20'b0;
		    read_address3 <= addr-20'b0;
        write_address3 <= addr-20'b0;
		    read_address4 <= addr-20'b0;
        write_address4 <= addr-20'b0;
		    read_address5 <= addr-20'b0;
        write_address5 <= addr-20'b0;
		  
		  end

      else if(20'b10000001000000000 <=addr && 20'b100000001000000000>addr) begin //512+65536+65536 
        wr_enable_image1 <=1'b0;
        wr_enable_image2 <=wr_enable;
        wr_enable_image3 <=1'b0;
        wr_enable_image4 <=1'b0;
        wr_enable_image5 <=1'b0;

        read_address1 <= addr-20'b0;
        write_address1 <= addr-20'b0;
        read_address2 <= addr-20'b10000001000000000;
        write_address2 <= addr-20'b10000001000000000;
        read_address3 <= addr-20'b0;
        write_address3 <= addr-20'b0;
        read_address4 <= addr-20'b0;
        write_address4 <= addr-20'b0;
        read_address5 <= addr-20'b0;
        write_address5 <= addr-20'b0;
		  end

		  else if(20'b100000001000000000 <=addr && 20'b110000001000000000>addr) begin //512+65536
        wr_enable_image1 <=1'b0;
        wr_enable_image2 <=1'b0;
        wr_enable_image3 <=wr_enable;
        wr_enable_image4 <=1'b0;
        wr_enable_image5 <=1'b0;

        read_address1 <= addr-20'b0;
        write_address1 <= addr-20'b0;
        read_address2 <= addr-20'b0;
        write_address2 <= addr-20'b0;
        read_address3 <= addr-20'b100000001000000000;
        write_address3 <= addr-20'b100000001000000000;
        read_address4 <= addr-20'b0;
        write_address4 <= addr-20'b0;
        read_address5 <= addr-20'b0;
        write_address5 <= addr-20'b0;
		  end

		  else if(20'b110000001000000000 <=addr && 20'b1000000001000000000>addr) begin //512+65536
        wr_enable_image1 <=1'b0;
        wr_enable_image2 <=1'b0;
        wr_enable_image3 <=1'b0;
        wr_enable_image4 <=wr_enable;
        wr_enable_image5 <=1'b0;

        read_address1 <= addr-20'b0;
        write_address1 <= addr-20'b0;
        read_address2 <= addr-20'b0;
        write_address2 <= addr-20'b0;
        read_address3 <= addr-20'b0;
        write_address3 <= addr-20'b0;
        read_address4 <= addr-20'b110000001000000000;
        write_address4 <= addr-20'b110000001000000000;
		    read_address5 <= addr-20'b0;
        write_address5 <= addr-20'b0;
		  end

		  else if(20'b1000000001000000000 <=addr && 20'b1010000001000000000>addr) begin //512+65536
        wr_enable_image1 <=1'b0;
        wr_enable_image2 <=1'b0;
        wr_enable_image3 <=1'b0;
        wr_enable_image4 <=1'b0;
        wr_enable_image5 <=wr_enable;

        read_address1 <= addr-20'b0;
        write_address1 <= addr-20'b0;
  		  read_address2 <= addr-20'b0;
        write_address2 <= addr-20'b0;
        read_address3 <= addr-20'b0;
        write_address3 <= addr-20'b0;
        read_address4 <= addr-20'b0;
        write_address4 <= addr-20'b0;
        read_address5 <= addr-20'b1000000001000000000;
        write_address5 <= addr-20'b1000000001000000000;
	 	  end
		  else begin
  			wr_enable_image1 <=1'b0;
        wr_enable_image2 <=1'b0;
        wr_enable_image3 <=1'b0;
        wr_enable_image4 <=1'b0;
        wr_enable_image5 <=1'b0;

        read_address1 <= addr-20'b0;
        write_address1 <= addr-20'b0;
	   	  read_address2 <= addr-20'b0;
        write_address2 <= addr-20'b0;
        read_address3 <= addr-20'b0;
        write_address3 <= addr-20'b0;
        read_address4 <= addr-20'b0;
        write_address4 <= addr-20'b0;
        read_address5 <= addr-20'b0;
        write_address5 <= addr-20'b0;
		  end
	  end
	  else begin 
		  write_address<= 6'b0;
      read_address<= 6'b0;
		  wr_enable_image1 <=1'b0;
      wr_enable_image2 <=1'b0;
      wr_enable_image3 <=1'b0;
      wr_enable_image4 <=1'b0;
      wr_enable_image5 <=1'b0;
      wr_enable_histogram <=1'b0;
      read_address1 <= addr-20'b0;
      write_address1 <= addr-20'b0;
      read_address2 <= addr-20'b0;
      write_address2 <= addr-20'b0;
      read_address3 <= addr-20'b0;
      write_address3 <= addr-20'b0;
      read_address4 <= addr-20'b0;
      write_address4 <= addr-20'b0;
      read_address5 <= addr-20'b0;
      write_address5 <= addr-20'b0;
	  end
	end

  
	
  ramHistogram  histogramMem(clk, inData, read_address,write_address, wr_enable_histogram, output_histogram);

  ramImage1 imageMem1(read_address1, cont, clk,	 vga_clk,	 write_address1, 8'b0, wr_enable_image1, 1'b0, output_image1,pixel1);  
  ramImage2 imageMem2(read_address2, cont, clk,  vga_clk,  write_address2, 8'b0, wr_enable_image2, 1'b0, output_image2,pixel2); 
  ramImage3 imageMem3(read_address3, cont, clk,  vga_clk,  write_address3, 8'b0, wr_enable_image3, 1'b0, output_image3,pixel3);  
  ramImage4 imageMem4(read_address4, cont, clk,  vga_clk,  write_address4, 8'b0, wr_enable_image4, 1'b0, output_image4,pixel4);  
  ramImage5 imageMem5(read_address5, cont, clk,  vga_clk,  write_address5, 8'b0, wr_enable_image5, 1'b0, output_image5,pixel5); 

  always_ff @(negedge clk) begin 
    if(addr < 20'b1000000000) begin
      outData[0]<=output_histogram;
      outData[1]<=output_histogram;
      outData[2]<=output_histogram;
      outData[3]<=output_histogram;
      outData[4]<=output_histogram;
      outData[5]<=output_histogram;
      outData[6]<=output_histogram;
      outData[7]<=output_histogram;
    end

    else if(addr >= 20'b1000000000 && 20'b10000001000000000 >addr ) begin //512+65536
      outData[0]<=output_image1;
      outData[1]<=output_image1;
      outData[2]<=output_image1;
      outData[3]<=output_image1;
      outData[4]<=output_image1;
      outData[5]<=output_image1;
      outData[6]<=output_image1;
      outData[7]<=output_image1;
    end

    else if(20'b10000001000000000 <=addr && 20'b100000001000000000>addr) begin //512+65536+65536 
      outData[0]<=output_image2;
      outData[1]<=output_image2;
      outData[2]<=output_image2;
      outData[3]<=output_image2;
      outData[4]<=output_image2;
      outData[5]<=output_image2;
      outData[6]<=output_image2;
      outData[7]<=output_image2;
    end

    else if(20'b100000001000000000 <=addr && 20'b110000001000000000>addr) begin //512+65536
      outData[0]<=output_image3;
      outData[1]<=output_image3;
      outData[2]<=output_image3;
      outData[3]<=output_image3;
      outData[4]<=output_image3;
      outData[5]<=output_image3;
      outData[6]<=output_image3;
      outData[7]<=output_image3;
    end

    else if(20'b110000001000000000 <=addr && 20'b1000000001000000000>addr) begin //512+65536
      outData[0]<=output_image4;
      outData[1]<=output_image4;
      outData[2]<=output_image4;
      outData[3]<=output_image4;
      outData[4]<=output_image4;
      outData[5]<=output_image4;
      outData[6]<=output_image4;
      outData[7]<=output_image4;
    end

    else if(20'b1000000001000000000 <=addr && 20'b1010000001000000000>addr) begin //512+65536
      outData[0]<=output_image5;
      outData[1]<=output_image5;
      outData[2]<=output_image5;
      outData[3]<=output_image5;
      outData[4]<=output_image5;
      outData[5]<=output_image5;
      outData[6]<=output_image5;
      outData[7]<=output_image5;
    end
    else begin 
      outData[0]<=8'b0;
      outData[1]<=8'b0;
      outData[2]<=8'b0;
      outData[3]<=8'b0;
      outData[4]<=8'b0;
      outData[5]<=8'b0;
      outData[6]<=8'b0;
      outData[7]<=8'b0;
    end
  end

endmodule
