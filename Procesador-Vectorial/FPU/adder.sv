module adder( input logic [31:0] a, b,
				output logic [31:0] out);
	
	logic a_sign, b_sign, o_sign;
	logic [7:0] a_exponent, b_exponent, o_exponent;
	logic [23:0] a_mantissa, b_mantissa;
	logic [24:0] o_mantissa;
	
	logic [7:0] diff, tmp_exponent;
	logic [23:0] tmp_mantissa;
	
	logic [7:0] i_e, o_e;
	logic [24:0] i_m, o_m;
	
	
	//add_norm call
	add_norm norm1	((i_e),(i_m),(o_e),(o_m));
	
	assign out[31] = o_sign;
	assign out[30:23] = o_exponent;
	assign out[22:0] = o_mantissa[22:0];
	
	always @* begin
			
			//______________________________________________Asigna exponentes, mantisas y signos.
			a_sign = a[31]; // Asigna signo de A
			
			if(a[30:23] == 0) begin //En caso de que el exponente de a sea 0
				a_exponent = 8'b00000001;
				a_mantissa = {1'b0, a[22:0]};
			end else begin
				a_exponent = a[30:23];//Asigna el exponente de a
				a_mantissa = {1'b1, a[22:0]};//Asigna la mantissa de a
			end
			
			b_sign = b[31]; // Asigna signo de B
			
			if(b[30:23] == 0) begin //En caso de que el exponente de b sea 0
				b_exponent = 8'b00000001;
				b_mantissa = {1'b0, b[22:0]};
			end else begin
				b_exponent = b[30:23]; //Asigna el exponente de b
				b_mantissa = {1'b1, b[22:0]}; //Asigna la mantissa de b
			end
		
		
		//______________________________________________Casos de los exponentes
		
		if (a_exponent == b_exponent) begin //_________________________________Caso1: Si los exponentes son iguales
			o_exponent = a_exponent;
			if (a_sign == b_sign) begin // Si los signos son iguales
			  o_mantissa = a_mantissa + b_mantissa;
			  //Shift
			  o_mantissa[24] = 1;
			  o_sign = a_sign;
			end else begin // Si los signos son diferentes
				if(a_mantissa > b_mantissa) begin //Si a es mayorse le resta b
					o_mantissa = a_mantissa - b_mantissa;
					o_sign = a_sign; //Otorga signo de a por ser mayor
				end else begin//Si b es mayor que a
					o_mantissa = b_mantissa - a_mantissa; 
					o_sign = b_sign; //Otorga signo de b por ser mayor
				end
			end
		
		end else begin //______________________________________________________Caso2: Exponentes diferentes (Se hace resta)
			
			if (a_exponent > b_exponent) begin //-------------------------SubCaso1: Exponente de a es mayor
				o_exponent = a_exponent; //Se mantiene el exponente a
				o_sign = a_sign;	//Se mantiene el signo de a
					diff = a_exponent - b_exponent; //Diferencia entre exponentes
				tmp_mantissa = b_mantissa >> diff; //Se hace corrimiento de la diferencia a la mantisa de b
			
			if (a_sign == b_sign) 	//Mismo signo se suma
				o_mantissa = a_mantissa + tmp_mantissa;
			else							//Diferente signo se resta
          	o_mantissa = a_mantissa - tmp_mantissa;
				
			end else if (a_exponent < b_exponent) begin //----------------SubCaso2: Exponente de b es mayor
				o_exponent = b_exponent; //Se mentiene el signo de b
				o_sign = b_sign; //Se mantiene el signo de b
				diff = b_exponent - a_exponent; //Diferencia entre exponentes
				tmp_mantissa = a_mantissa >> diff; //Se hace corrimiento de la diferencia a la mantisa de a
				if (a_sign == b_sign) begin//Mismo signo se suma
					o_mantissa = b_mantissa + tmp_mantissa;
				end else begin //Diferente signo se resta
					o_mantissa = b_mantissa - tmp_mantissa;
				end
			end
		end
		if(o_mantissa[24] == 1) begin
			o_exponent = o_exponent + 1;
			o_mantissa = o_mantissa >> 1;
		end else if((o_mantissa[23] != 1) && (o_exponent != 0)) begin //se normaliza el numero
			i_e = o_exponent;
			i_m = o_mantissa;
			o_exponent = o_e;
			o_mantissa = o_m;
		end
	end
endmodule