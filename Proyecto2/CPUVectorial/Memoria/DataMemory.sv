module DataMemory #(parameter IMAGE_WIDTH=96,IMAGE_HEIGHT=96,PIX_SIZE=8)
						(input logic CLK, WE,
						input logic s3,s2,s1,s0,
						input logic [15:0] Addr,
						input logic [15:0][15:0] WD,
						output logic [15:0][15:0] RD); //16 de 16bits 
	
	logic [15:0][15:0] RD1,RD2,RD3,RD4,RD5,RD6,RD7,RD8,RD9,RD10,RD11,RD12,RD13,RD14,RD15,RD16,RD17;
	
	
	LECDataMemory1 #(96,96,8) MEM1(CLK, Addr, RD1);
	LECDataMemory2 #(96,96,8) MEM2(CLK, Addr, RD2);
	LECDataMemory3 #(96,96,8) MEM3(CLK, Addr, RD3);
	LECDataMemory4 #(96,96,8) MEM4(CLK, Addr, RD4);
	LECDataMemory5 #(96,96,8) MEM5(CLK, Addr, RD5);
	LECDataMemory6 #(96,96,8) MEM6(CLK, Addr, RD6);
	LECDataMemory7 #(96,96,8) MEM7(CLK, Addr, RD7);
	LECDataMemory8 #(96,96,8) MEM8(CLK, Addr, RD8);
	LECDataMemory9 #(96,96,8) MEM9(CLK, Addr, RD9);
	LECDataMemory10 #(96,96,8) MEM10(CLK, Addr, RD10);
	LECDataMemory11 #(96,96,8) MEM11(CLK, Addr, RD11);
	LECDataMemory12 #(96,96,8) MEM12(CLK, Addr, RD12);
	LECDataMemory13 #(96,96,8) MEM13(CLK, Addr, RD13);
	LECDataMemory14 #(96,96,8) MEM14(CLK, Addr, RD14);
	LECDataMemory15 #(96,96,8) MEM15(CLK, Addr, RD15);
	LECDataMemory16 #(96,96,8) MEM16(CLK, Addr, RD16);
	WRDataMemory #(192,192,8) WRMEM(CLK, WE, Addr, WD, RD17);
	VecMux16_1 #(16,16) MUX(RD1,RD2,RD3,RD4,RD5,RD6,RD7,RD8,RD9,RD10,RD11,RD12,RD13,RD14,RD15,RD16,{s3,s2,s1,s0},RD); 
	
	
	
	
endmodule:DataMemory
