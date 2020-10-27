module Control_UnitTB();

logic Clock, reset, RegWrite, MemWrite, MemToReg;
logic [1:0] ALUSrc, ImmSrc, RegSrc;
logic [2:0] ALUControl;
logic [27:0] Instr;

  // Clock generator
always
  begin
    #10 Clock = 1;
    #10 Clock = 0;
  end
  
control_unit controlUnitTB (Clock,Instr[17:0], RegWrite, MemWrite, MemToReg, ImmSrc, ALUSrc, RegSrc, ALUControl);

initial begin 
	reset=0;
	Instr= 28'b0000000000000000001100110011; #20;// ADD
	assert (RegWrite === 1) else $error("RegWrite fail [ADD]");
	assert (MemWrite === 0) else $error("MemWrite fail [ADD]");
	assert (MemToReg === 0) else $error("MemToReg fail [ADD]");
	assert (ImmSrc === 2'b11) else $error("ImmSrc fail [ADD]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [ADD]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [ADD]");
	assert (ALUControl === 3'b000) else $error("ALUControl fail [ADD]");
	
	reset=0;
	Instr= 28'b0000000000000011001100110011; #20; //MUL
	assert (RegWrite === 1) else $error("RegWrite fail [MUL]");
	assert (MemWrite === 0) else $error("MemWrite fail [MUL]");
	assert (MemToReg === 0) else $error("MemToReg fail [MUL]");
	assert (ImmSrc === 2'b11) else $error("ImmSrc fail [MUL]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [MUL]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [MUL]");
	assert (ALUControl === 3'b011) else $error("ALUControl fail [MUL]");

	reset=0;
	Instr= 28'b0000000000000001001100110011; #20; //SUB
	assert (RegWrite === 1) else $error("RegWrite fail [SUB]");
	assert (MemWrite === 0) else $error("MemWrite fail [SUB]");
	assert (MemToReg === 0) else $error("MemToReg fail [SUB]");
	assert (ImmSrc === 2'b11) else $error("ImmSrc fail [SUB]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [SUB]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [SUB]");
	assert (ALUControl === 3'b001) else $error("ALUControl fail [SUB]");
	
	reset=0;
	Instr= 28'b0000000000000100001100110011;#20 //DIV
	assert (RegWrite === 1) else $error("RegWrite fail [DIV]");
	assert (MemWrite === 0) else $error("MemWrite fail [DIV]");
	assert (MemToReg === 0) else $error("MemToReg fail [DIV]");
	assert (ImmSrc === 2'b11) else $error("ImmSrc fail [DIV]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [DIV]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [DIV]");
	assert (ALUControl === 3'b100) else $error("ALUControl fail [DIV]");
	
	reset=0;
	Instr= 28'b0000000101001010000010000000; #20 //MOV
	assert (RegWrite === 1) else $error("RegWrite fail [MOV]");
	assert (MemWrite === 0) else $error("MemWrite fail [MOV]");
	assert (MemToReg === 0) else $error("MemToReg fail [MOV]");
	assert (ImmSrc === 2'b00) else $error("ImmSrc fail [MOV]");
	assert (ALUSrc === 2'b11) else $error("ALUSrc fail [MOV]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [MOV]");
	assert (ALUControl === 3'b010) else $error("ALUControl fail [MOV]");
	
	reset=0;
	Instr= 28'b0000000000010001000001111000; #20 //LDR
	assert (RegWrite === 1) else $error("RegWrite fail [LDR]");
	assert (MemWrite === 0) else $error("MemWrite fail [LDR]");
	assert (MemToReg === 1) else $error("MemToReg fail [LDR]");
	assert (ImmSrc === 2'b01) else $error("ImmSrc fail [LDR]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [LDR]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [LDR]");
	assert (ALUControl === 3'b111) else $error("ALUControl fail [LDR]");
	
	reset=0;
	Instr= 28'b0000000000010000000010000010; #20 //STR
	assert (RegWrite === 0) else $error("RegWrite fail [STR]");
	assert (MemWrite === 1) else $error("MemWrite fail [STR]");
	assert (MemToReg === 0) else $error("MemToReg fail [STR]");
	assert (ImmSrc === 2'b01) else $error("ImmSrc fail [STR]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [STR]");
	assert (RegSrc === 2'b10) else $error("RegSrc fail [STR]");
	assert (ALUControl === 3'b111) else $error("ALUControl fail [STR]");
	
	reset=0;
	Instr= 28'b0000000000000101001100110011; #20;//CMP
	assert (RegWrite === 1) else $error("RegWrite fail [CMP]");
	assert (MemWrite === 0) else $error("MemWrite fail [CMP]");
	assert (MemToReg === 0) else $error("MemToReg fail [CMP]");
	assert (ImmSrc === 2'b11) else $error("ImmSrc fail [CMP]");
	assert (ALUSrc === 2'b00) else $error("ALUSrc fail [CMP]");
	assert (RegSrc === 2'b00) else $error("RegSrc fail [CMP]");
	assert (ALUControl === 3'b101) else $error("ALUControl fail [CMP]");
	
end

endmodule


