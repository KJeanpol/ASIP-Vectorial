
// Modulo de add basado en Proyecto FPU de Daniel Shanley
// EEE 754 floating point unit in Verilog (2016)
// https://github.com/danshanley/FPU

module FPU( input logic CLK,
				input logic enable,
				input logic [31:0] A, B,
				input logic [1:0] opcode,
				input logic reset,
				output logic ready,
				output logic [31:0] O );
	
	logic [7:0] a_exponent, b_exponent;
	logic [23:0] a_mantissa, b_mantissa;

	logic	o_sign;
	logic [7:0]  o_exponent;
	logic [24:0] o_mantissa;
	
	logic [31:0] adder_a_in;
	logic [31:0] adder_b_in;
	logic [31:0] adder_out;
	
	logic [31:0] temp_O;

	logic [31:0] multiplier_a_in;
	logic [31:0] multiplier_b_in;
	logic [31:0] multiplier_out;
	
	logic [31:0] divider_a_in;
	logic [31:0] divider_b_in;
	logic [31:0] divider_out;
	
	logic [7:0]clock_counter = 0;
	
	logic enabled_before = 0;
	
	logic ADD , SUB, DIV, MUL;
	
	assign O[31] = o_sign;
	assign O[30:23] = o_exponent;
	assign O[22:0] = o_mantissa[22:0];
	
	assign a_sign = A[31];
	assign a_exponent[7:0] = A[30:23];
	assign a_mantissa[23:0] = {1'b1, A[22:0]};

	assign b_sign = B[31];
	assign b_exponent[7:0] = B[30:23];
	assign b_mantissa[23:0] = {1'b1, B[22:0]};

	assign ADD = !opcode[1] & !opcode[0];
	assign SUB = !opcode[1] & opcode[0];
	assign DIV = opcode[1] & !opcode[0];
	assign MUL = opcode[1] & opcode[0];
	
	adder a1	(adder_a_in,adder_b_in,adder_out);
	multiplier m1 (multiplier_a_in,multiplier_b_in,multiplier_out);
	
	logic[31:0] div_temp;
	logic[31:0] mul_temp;
	logic[31:0] add_temp;
	
	div_ip div1 (CLK, divider_a_in, divider_b_in, divider_out); 
	
	logic clkON;
	assign clkON = CLK && enable;
	
	always_comb begin
		if (ADD | SUB | MUL) begin
			ready = (clock_counter > 0) ? 1 : 0;
		end else if (DIV) begin
			ready = (clock_counter > 15) ? 1 : 0;
		end else begin
			ready = 0;
		end
	end
	
	always_ff @ (posedge CLK, negedge reset, negedge enable ) begin
		if (~reset | ~enable ) begin
			clock_counter <= 0;
			enabled_before <= 0;
			//o_sign = 1'b0;
			//o_exponent = 8'b11111111;
			//o_mantissa = 25'b1111111111111111111111111;
		
		end else if ( enable & ~enabled_before ) begin
			enabled_before <= 1;
			clock_counter <= 0;
			
		end else if (enable) begin
			clock_counter <= clock_counter + 1;
		end
	end
	always_ff @ (posedge clkON) begin
		
		
		//_________________________________Caso de ADD o SUB
		if (ADD || SUB ) begin
		
			//Si a es NaN o b es zero retorna a
			if ((a_exponent == 255 && a_mantissa != 0) || (b_exponent == 0) && (b_mantissa == 0)) begin
				o_sign = a_sign;
				o_exponent = a_exponent;
				o_mantissa = a_mantissa;
			//Si b es NaN o a es zero retorna b
			end else if ((b_exponent == 255 && b_mantissa != 0) || (a_exponent == 0) && (a_mantissa == 0)) begin
				o_sign = b_sign;
				o_exponent = b_exponent;
				o_mantissa = b_mantissa;
			//Si a o b es infinito lo retorna
			end else if ((a_exponent == 255) || (b_exponent == 255)) begin
				o_sign = a_sign ^ b_sign;
				o_exponent = 255;
				o_mantissa = 0;
			//No es un caso extremo, se hace la adicion por modulo
			end else begin
				adder_a_in = A;
				if (ADD) begin
					adder_b_in = B;
				end else begin
					adder_b_in = {~B[31], B[30:0]};
				end
				
				add_temp = adder_out;
				o_sign = add_temp[31];
				o_exponent = add_temp[30:23];
				o_mantissa = add_temp[22:0];
			end
		
		//_________________________________Caso de DIV
		end else if (DIV) begin	
	
			divider_a_in = A;
			divider_b_in = B;
			div_temp = divider_out;
			o_sign = div_temp[31];
			o_exponent = div_temp[30:23];
			o_mantissa = div_temp[22:0];		
		//_________________________________Caso de MUL
		end if (MUL) begin 
			//Si a es NaN, retorna NaN
			if (a_exponent == 255 && a_mantissa != 0) begin
				o_sign = a_sign;
				o_exponent = 255;
				o_mantissa = a_mantissa;
			//SI b es NaN retorna NaN
			end else if (b_exponent == 255 && b_mantissa != 0) begin
				o_sign = b_sign;
				o_exponent = 255;
				o_mantissa = b_mantissa;
			//Si a o b es 0 retorna 0
			end else if ((a_exponent == 0) && (a_mantissa == 0) || (b_exponent == 0) && (b_mantissa == 0)) begin
				o_sign = a_sign ^ b_sign;
				o_exponent = 0;
				o_mantissa = 0;
			//Si a o b es infinito lo retorna
			end else if ((a_exponent == 255) || (b_exponent == 255)) begin
				o_sign = a_sign;
				o_exponent = 255;
				o_mantissa = 0;
			//No es un caso extremo, se hace la multiplicacion por modulo
			end else begin
				multiplier_a_in = A;
				multiplier_b_in = B;
				mul_temp = multiplier_out;
				o_sign = mul_temp[31];
				o_exponent = mul_temp[30:23];
				o_mantissa = mul_temp[22:0];
			end
		end
	end
	
	
	
	
endmodule




