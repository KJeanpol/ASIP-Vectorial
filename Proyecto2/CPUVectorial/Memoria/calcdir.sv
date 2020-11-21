module calcdir(input logic [15:0] Addr,
					output logic [15:0] outAddr[15:0]);
					
			assign outAddr[0] = Addr;
			assign outAddr[1] = Addr+16'b1;//000;
			assign outAddr[2] = Addr+16'b10;//000;
			assign outAddr[3] = Addr+16'b11;//000;
			assign outAddr[4] = Addr+16'b100;//000;
			assign outAddr[5] = Addr+16'b101;//000;
			assign outAddr[6] = Addr+16'b110;//000;
			assign outAddr[7] = Addr+16'b111;//000;
			assign outAddr[8] = Addr+16'b1000;//000;
			assign outAddr[9] = Addr+16'b1001;//000;
			assign outAddr[10] = Addr+16'b1010;//000;
			assign outAddr[11] = Addr+16'b1011;//000;
			assign outAddr[12] = Addr+16'b1100;//000;
			assign outAddr[13] = Addr+16'b1101;//000;
			assign outAddr[14] = Addr+16'b1110;//000;
			assign outAddr[15] = Addr+16'b1111;//000;
			
endmodule:calcdir