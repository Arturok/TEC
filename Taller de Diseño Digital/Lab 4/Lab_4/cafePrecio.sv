module cafePrecio (input logic [3:0] bebida,
						output logic [3:0] precio);

always_comb
			case (bebida)
				4'b0001:	//espresso
						precio = 4'b0011;				
				4'b0010: // cafe con leche
						precio =  4'b0100;				
				4'b0100: //Capuccino
						precio = 4'b0101;
				4'b1000: //Moccaccino
						precio = 4'b0111;
			
				default: //default
						precio = 4'b0000;
				
			endcase
			
endmodule