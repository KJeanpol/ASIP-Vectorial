module vectorMemory #(parameter Width=640)(
			input logic CLK, 
			input logic VGA_CLK,
			input logic [1:0] kernel,
			input logic bounds_draw,
			input logic [9:0] hcount, vcount,
			output logic [7:0] pixel,
			output logic [2:0][17:0] ReadDataVec,
			input logic WriteEnable,
			input logic [2:0][17:0] writeData,
			input logic [18:0] A1,A2,A3);
	
	logic [1:0] cont=0;
	logic [18:0] addressMem;
	logic [17:0] readData;
	logic [7:0] color;

	always_ff @(negedge VGA_CLK) begin 
		case(cont)
			2'b00: begin
				cont<= cont + 2'b1;
				addressMem <= A1;
				ReadDataVec[0]<= readData;
			end
			2'b01: begin
				cont<= cont + 2'b1;
				addressMem <= A2;
				ReadDataVec[1]<= readData;
			end
			2'b10: begin
				cont<= cont + 2'b1;
				addressMem <= A3;
				ReadDataVec[2]<= readData;
			end
			2'b11: begin
				cont<=0;
			end
		endcase
	end
	
	/*always_ff @(negedge VGA_CLK) begin
		case(cont)
			2'b00: begin
				ReadDataVec[0]<= readData;
			end
			2'b01: begin
				ReadDataVec[1]<= readData;
			end
			2'b10: begin
				ReadDataVec[2]<= readData;
			end
			2'b11: begin
				cont<=0;
			end
		endcase
	end*/

	always_ff@(posedge VGA_CLK) begin		
		if (bounds_draw == 1'b1) begin
			pixel <=color;
		end
		else begin 
			pixel = 8'b0;
		end
	end

	imageDrawer  drawer(CLK,VGA_CLK,kernel,bounds_draw,hcount,vcount,color,readData,WriteEnable,writeData[0],addressMem);

	/*logic [17:0] read1,read2,read3;
	logic [7:0] color;
	
	imageDrawer  drawer1(clk,bounds_draw,hcount,vcount,color,read1,WriteEnable,writeData[0][7:0],A1);
	imageDrawer  drawer2(clk,bounds_draw,hcount,vcount,color,read2,WriteEnable,writeData[1][7:0],A2);
	imageDrawer  drawer3(clk,bounds_draw,hcount,vcount,color,read3,WriteEnable,writeData[2][7:0],A3);
	
	always_ff @(posedge clk ) begin 
		ReadData[0]=read1;
		ReadData[1]=read2;
		ReadData[2]=read3;
		pixel = color;
	end*/

endmodule
