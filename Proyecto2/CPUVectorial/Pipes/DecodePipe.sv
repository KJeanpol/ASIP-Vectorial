module DecodePipe #(parameter N=8)(
		input logic [15:0][N-1:0] rd1,
		input logic [15:0][N-1:0] rd2,
		input logic [3:0] ra1,ra2,
		input logic [15:0][N-1:0] extend,
		input logic clk, reset,cargar,
		input logic RegWrite, MemtoReg, MemWrite, 
		input logic [1:0] ALUSrc,
		input logic [2:0] ALUControl,
		input logic [3:0] WA3,
		output logic [15:0][N-1:0] rd1o,
		output logic [15:0][N-1:0] rd2o,
		output logic [3:0] ra1o, ra2o,
		output logic [15:0][N-1:0] extendO,
		output logic RegWriteO, MemtoRegO, MemWriteO,
		output logic [1:0] ALUSrcO,
		output logic [2:0] ALUControlO,
		output logic [3:0] WA3O
		);
	 
	always_ff@(posedge clk)
		if(reset) 
			begin
			//rd1
			rd1o [0]= 8'b0;
			rd1o [1]= 8'b0;
			rd1o [2]= 8'b0;
			rd1o [3]= 8'b0;
			rd1o [4]= 8'b0;
			rd1o [5]= 8'b0;
			rd1o [6]= 8'b0;
			rd1o [7]= 8'b0;
			rd1o [8]= 8'b0;
			rd1o [9]= 8'b0;
			rd1o [10]= 8'b0;
			rd1o [12]= 8'b0;
			rd1o [13]= 8'b0;
			rd1o [14]= 8'b0;
			rd1o [15]= 8'b0;
			//rd2
			rd2o [0]= 8'b0;
			rd2o [1]= 8'b0;
			rd2o [2]= 8'b0;
			rd2o [3]= 8'b0;
			rd2o [4]= 8'b0;
			rd2o [5]= 8'b0;
			rd2o [6]= 8'b0;
			rd2o [7]= 8'b0;
			rd2o [8]= 8'b0;
			rd2o [9]= 8'b0;
			rd2o [10]= 8'b0;
			rd2o [11]= 8'b0;
			rd2o [12]= 8'b0;
			rd2o [13]= 8'b0;
			rd2o [14]= 8'b0;
			rd2o [15]= 8'b0;
			//ra
			ra1o = 4'b0;
			ra2o = 4'b0;
			//extendO
			extendO[0] = 8'b0;
			extendO[1] = 8'b0;
			extendO[2] = 8'b0;
			extendO[3] = 8'b0;
			extendO[4] = 8'b0;
			extendO[5] = 8'b0;
			extendO[6] = 8'b0;
			extendO[7] = 8'b0;
			extendO[8] = 8'b0;
			extendO[9] = 8'b0;
			extendO[10] = 8'b0;
			extendO[11] = 8'b0;
			extendO[12] = 8'b0;
			extendO[13] = 8'b0;
			extendO[14] = 8'b0;
			extendO[15] = 8'b0;
			//RegWriteO, MemtoRegO, MemWriteO, ALUSrcO, ALUControlO, WA3O
			RegWriteO = 1'b0;
			MemtoRegO = 1'b0;
			MemWriteO = 1'b0;
			ALUSrcO = 2'b0;
			ALUControlO = 3'b0;
			WA3O = 4'b0;
			end
		else if(cargar)
			begin
			rd1o = rd1;
			rd2o = rd2;
			ra1o = ra1;
			ra2o = ra2;
			extendO = extend;
			RegWriteO = RegWrite;
			MemtoRegO = MemtoReg;
			MemWriteO = MemWrite;
			ALUSrcO = ALUSrc;
			ALUControlO = ALUControl;
			WA3O = WA3;
			end
endmodule