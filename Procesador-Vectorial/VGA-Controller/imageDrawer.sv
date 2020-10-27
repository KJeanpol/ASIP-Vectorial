module imageDrawer #(parameter Width=640)(input logic clk,VGA_CLK,
			input logic [1:0] kernel,
			input logic bounds_draw,
			input logic [9:0] hcount, vcount,
			output logic [7:0] pixel,
			output logic [17:0] ReadData,
			input logic WriteEnable,
			input logic [17:0] writeData,
			input logic [18:0] adreesMem);
	
	logic [2:0] addrY,addrYData;
	logic [15:0] addrPixel,addrData;
	//logic [9:0] horz,vert;
	logic [7:0] memPixel1,memPixel2,memPixel3,memPixel4,memPixel5;
	logic [7:0] memPixel1_K,memPixel2_K,memPixel3_K,memPixel4_K,memPixel5_K;
	logic [18:0] position;
	logic writeEn1,writeEn2,writeEn3,writeEn4,writeEn5;
	logic [7:0] memData1,memData2, memData3, memData4, memData5;
	logic [7:0] memData1_K,memData2_K, memData3_K, memData4_K, memData5_K;
	
	/*assign vert=(vcount-10'b0000001101);  //13
	assign horz=(hcount-10'b0001110000);  //112*/


	assign position=((vcount*Width) + hcount);

	//assign address = (vert*10'b1000000000) + horz;
	assign {addrY, addrPixel}= (bounds_draw)? position: 19'b0;
	assign {addrYData, addrData}= adreesMem;
 
	//assign addrY = (horz*10'b111111111) + vert;
	always_ff @(posedge clk ) begin
		if(WriteEnable==1'b1) begin
			case(addrYData)
				3'b000: begin
				 	writeEn1=1'b1;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b001: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b1;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b010: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b1;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b011: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b1;
				 	writeEn5=1'b0;
				end
				3'b100: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b1;
				end
				default: begin
					writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
			endcase
		end
	end
	
	SDRam1 datamem1 (addrData,addrPixel,clk,VGA_CLK,8'b0,8'b0,1'b0,1'b0,memData1,memPixel1);
	SDRam2 datamem2 (addrData,addrPixel,clk,VGA_CLK,8'b0,8'b0,1'b0,1'b0,memData2,memPixel2);
	SDRam3 datamem3 (addrData,addrPixel,clk,VGA_CLK,8'b0,8'b0,1'b0,1'b0,memData3,memPixel3);
	/*SDRam4 datamem4 (addrData,addrPixel,clk,VGA_CLK,8'b0,8'b0,1'b0,1'b0,memData4,memPixel4);
	SDRam5 datamem5 (addrData,addrPixel,clk,VGA_CLK,8'b0,8'b0,1'b0,1'b0,memData5,memPixel5);*/

	SDRam6 datamem6 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn1,1'b0,memData1_K,memPixel1_K);
	SDRam7 datamem7 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn2,1'b0,memData2_K,memPixel2_K);
	SDRam8 datamem8 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn3,1'b0,memData3_K,memPixel3_K);
	/*SDRam9 datamem9 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn4,1'b0,memData4_K,memPixel4_K);
	SDRam10 datamem10 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn5,1'b0,memData5_K,memPixel5_K);*/
	
	always_ff@(posedge clk) begin		
		if (bounds_draw == 1'b1) begin
			case(addrY)
				3'b000: begin
					if(kernel==2'b00) pixel = memPixel1;
					else begin
						if(memPixel1_K<0) begin
							pixel =8'b0;		
						end
						else if(memPixel1_K>255) begin
							pixel =8'd255;		
						end
						else begin 
					 		pixel = memPixel1_K;
					 	end
					end
				end
				3'b001: begin
					if(kernel==2'b00) pixel = memPixel2;
					else begin
						if(memPixel2_K<0) begin
							pixel =8'b0;		
						end
						else if(memPixel2_K>255) begin
							pixel =8'd255;		
						end
						else begin 
					 		pixel = memPixel2_K;
					 	end
					end
				end
				3'b010: begin
					if(kernel==2'b00) pixel = memPixel3;
					else begin
						if(memPixel3_K<0) begin
							pixel =8'b0;		
						end
						else if(memPixel3_K>255) begin
							pixel =8'd255;		
						end
						else begin 
					 		pixel = memPixel3_K;
					 	end
					end
				end
				/*3'b011: begin
					if(kernel==2'b00) pixel = memPixel4;
					else begin
						if(memPixel4_K<0) begin
							pixel =8'b0;		
						end
						else if(memPixel4_K>255) begin
							pixel =8'd255;		
						end
						else begin 
					 		pixel = memPixel4_K;
					 	end
					end
				end
				3'b100: begin
					if(kernel==2'b00) pixel = memPixel5;
					else begin
						if(memPixel5_K<0) begin
							pixel =8'b0;		
						end
						else if(memPixel5_K>255) begin
							pixel =8'd255;		
						end
						else begin 
					 		pixel = memPixel5_K;
					 	end
					end
				end*/
				default: pixel = 8'b0;
			endcase
		end
		else begin 
			pixel = 8'b0;
		end
	end
	
	always_ff@(posedge clk) begin		
		case(addrYData)
			3'b000: begin
			 /*if(kernel== 2'b00) ReadData = memData1;
			 else ReadData = memData1_K;*/
			 ReadData = memData1;
			end
			3'b001: begin
			 /*if(kernel== 2'b00) ReadData = memData2;
			 else ReadData = memData2_K;*/
			 ReadData = memData2;
			end
			3'b010: begin
			 /*if(kernel== 2'b00) ReadData = memData3;
			 else ReadData = memData3_K;*/
			 ReadData = memData3;
			end
			/*3'b011: begin
			 if(kernel== 2'b00) ReadData = memData4;
			 else ReadData = memData4_K;
			end
			3'b100: begin
			 if(kernel== 2'b00) ReadData = memData5;
			 else ReadData = memData5_K;
			end*/
			default: ReadData = 18'b0;
		endcase
	end
	
	
endmodule