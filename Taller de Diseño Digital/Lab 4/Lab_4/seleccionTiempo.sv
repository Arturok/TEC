module seleccionTiempo ( input logic [3:0] ingrediente,
input logic [3:0] bebida,
output logic [1:0] seleccion);


logic espresso, cafL, capucci, mocca;
assign espresso = bebida[0];
assign cafL = bebida[1];
assign capucci = bebida [2];
assign mocca = bebida[3];	
							
	always_comb
			case (ingrediente)
				4'b0001:	//agua
						seleccion = espresso|cafL|capucci ? 2'b01  : (mocca ? 2'b10: 2'b10);				
				4'b0011: // cafe
						seleccion = capucci| mocca ? 2'b10  : (espresso ? 2'b00: (cafL ? 2'b01: 2'b11));				
				4'b0101: //leche
						seleccion = cafL| mocca ? 2'b10  : (capucci ? 2'b01: 2'b11);
				4'b0111: //chocolate
						seleccion = mocca ? 2'b01  : 2'b11;
				4'b1001: //azucar
						seleccion = 2'b10;
				default: //default
						seleccion = 2'b11;
				
			endcase
							
							
							
endmodule