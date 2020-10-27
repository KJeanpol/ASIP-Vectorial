module FilterGPUTB();

logic Clock, RST;
logic [27:0] Instr;
logic [2:0][17:0] ReadData;
logic [31:0] PC;
logic MemWriteM;
logic [2:0][17:0] writeData;
logic [18:0] A1,A2,A3;
logic [1:0] kernel;

  // Clock generator
always
  begin
    #10 Clock = 1;
    #10 Clock = 0;
  end

filterGPU filterGPUTB(Clock, RST,Instr,ReadData,PC,MemWriteM,writeData,A1,A2,A3);

imem imemtb(PC, kernel,Instr);

vectorMemory uutb(A1,A2,A3, writeData[0], writeData[1], writeData[2],OE, wEnable, clock,register);

initial begin
	RST = 1'b0;
	kernel = 2'b11;
	//Instr = 28'b0000000000000000010100110001;
	
end

endmodule
