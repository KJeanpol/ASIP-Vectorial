module extendUnitTB();

	logic [9:0] immediate;
	logic [7:0][19:0] extended;
	
	extendUnit #(8) uut(immediate, extended);
	
	initial begin 
	
	immediate = 10'b0011110000;
	#10;
	assert (extended === 8'b11110000) else $error("extended fail");
	
	
	end

endmodule
