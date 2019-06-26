module calculoVuelto (	
	input logic [3:0] cantDinero,
	input logic [3:0] bebidaSelect,
	output logic sufDinero,
	output logic [3:0] vuelto);
	
	logic [3:0] precio;
	
	
	cafePrecio precioCafe(bebidaSelect, precio);
	
	assign vuelto = cantDinero - precio;
	assign sufDinero = vuelto[3];
	
//	logic [3:0] selecBebida, salCalBebida, sVuelto;
//	logic Cout;
//	mux4 muxBebida(0011,0100,0101,0111,S,selecBebida);
//	assign sVuelto = cantDinero - selecBebida;
//	assign sufDinero = ~sVuelto[3];
//	mux2 muxVuelto(sVuelto,4'b0,~sVuelto[3], vuelto);
	
endmodule


