module preImem #(parameter N=18) (
			input logic reset,
			input logic [31:0] PC,
    		output logic [27:0] Instr );
		
	logic [31:0] cont;
	logic [31:0] finalPC;
	logic [31:0] temp;
	logic useCont;
	
	assign temp = (PC[27:2]-4)%(N);
	assign useCont=(PC[27:2] >N+4)? 1:0;
	assign cont =
			(reset)? 0:
			(cont===32'bx)? 32'b0 :
			(temp!=0)? cont : cont+1;
			
	
	assign finalPC=(~useCont)? PC:
						(cont<640*480)?((temp+4)<<2):32'bx;
	
	//logic [29:0] tempPC;
	
	
	/*always_comb begin		
		//tempPC = PC[31:2];
		if(reset)begin 
			cont=0;
			finalPC=PC;
		end
		else if( PC[31:2] <N+4)begin
			finalPC=PC;
			cont=0;
		end
		else if(( PC[31:2]-4)%N==0) begin
			finalPC=(( PC[31:2]-4)%N)<<2;
			cont= cont+1;
		end
		else begin
			finalPC=(( PC[31:2]-4)%N)<<2;
			cont=cont;
		end
	end*/
	
	
	imem imem(finalPC, Instr);

endmodule