module maquinaCafe(input logic [3:0] in_bebida,
						input logic moneda100, moneda500, cancelar, clk, reset,
						output logic Agua, Cafe, Leche, Chocolate, Azucar,
						output logic [6:0] pantalla); 
						
logic prepBebida, finBebida, sufDinero, timerReset,
tiempoPasado, mostrarVuelto, haySeleccion, hayDinero, syncMoneda100, syncMoneda500, mid100, mid500;


logic [3:0] ingredienteActual,cantDinero, bebida, vuelto, salida7seg;

//OR de entradas de bebida para saber si hay alguna seleccion y si hay dinero
n_or #(4) hayBebida (in_bebida, haySeleccion);
n_or #(4) metieronPlata(cantDinero, hayDinero);


						
//registros que guardan el valor de seleccion de bebida y el valor del tiempo pasado
register_n #(4) regBebida(in_bebida, haySeleccion, finBebida, bebida);
register_n #(1) regTiempo(tiempoPasado, clk, 0, timerReset);	

//sincronizador de entradas de monedas
register_n #(1) ent100(moneda100, clk, 0, mid100);
register_n #(1) sal100(mid100, clk, 0, syncMoneda100);
register_n #(1) ent500(moneda500,clk, 0, mid500);
register_n #(1) sal500(mid500, clk, 0, syncMoneda500);
 
//modulos de ayuda
sumadorMonedas guaca(syncMoneda100, syncMoneda500, clk, finBebida, cantDinero);
calculoVuelto vueltoCalc(cantDinero, bebida, sufDinero, vuelto);
tiempoIngrediente ingTiempo(ingredienteActual, bebida, clk, timerReset, tiempoPasado);
seven_seg_decoder deco7(salida7seg, pantalla);

//mux para elegir la salida de la pantalla (cantidad de dinero o vuelto)
mux2 salidaPantalla(cantDinero, vuelto, mostrarVuelto, salida7seg);

//maquinas de estado
maquinaControl control(cantDinero, finBebida, sufDinero, cancelar, clk, reset, prepBebida, mostrarVuelto);
preparacionBebida cafetera(clk, reset, prepBebida, tiempoPasado, finBebida,Agua, Cafe, Leche, Chocolate, Azucar);	
	
	
endmodule