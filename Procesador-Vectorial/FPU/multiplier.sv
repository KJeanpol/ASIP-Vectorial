module multiplier( input logic [31:0] a, b,
						output logic [31:0] out);
 
	logic a_sign;
	logic [7:0] a_exponent;
	logic [23:0] a_mantissa;
	logic b_sign;
	logic [7:0] b_exponent;
	logic [23:0] b_mantissa;

	logic o_sign;
	logic [7:0] o_exponent;
	logic [24:0] o_mantissa;

	logic [47:0] product;

	assign out[31] = o_sign;
	assign out[30:23] = o_exponent;
	assign out[22:0] = o_mantissa[22:0];

	logic  [7:0] i_e;
	logic  [47:0] i_m;
	logic [7:0] o_e;
	logic [47:0] o_m;

	mul_norm norm1 ((i_e),(i_m),(o_e),(o_m));

	always @ ( * ) begin
		a_sign = a[31];
		if(a[30:23] == 0) begin
			a_exponent = 8'b00000001;
			a_mantissa = {1'b0, a[22:0]};
		end else begin
			a_exponent = a[30:23];
			a_mantissa = {1'b1, a[22:0]};
		end
		b_sign = b[31];
		if(b[30:23] == 0) begin
			b_exponent = 8'b00000001;
			b_mantissa = {1'b0, b[22:0]};
		end else begin
			b_exponent = b[30:23];
			b_mantissa = {1'b1, b[22:0]};
		end
		o_sign = a_sign ^ b_sign;
		o_exponent = a_exponent + b_exponent - 127;
		product = a_mantissa * b_mantissa;
		// Se normaliza de ser necesario
		if(product[47] == 1) begin
			o_exponent = o_exponent + 1;
			product = product >> 1;
		end else if((product[46] != 1) && (o_exponent != 0)) begin
			i_e = o_exponent;
			i_m = product;
			o_exponent = o_e;
			product = o_m;
		end
		o_mantissa = product[46:23];
	end
endmodule