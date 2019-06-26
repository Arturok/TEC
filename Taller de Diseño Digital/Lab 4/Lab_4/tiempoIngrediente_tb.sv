module tiempoIngrediente_tb();

timeunit 10ns;
timeprecision 1ns;

logic [3:0] bebida, ingrediente;
logic clk, reset, pasoTiempo;




tiempoIngrediente dut(ingrediente, bebida, clk, reset, pasoTiempo);

initial begin
clk=0;
pasoTiempo =1;
bebida =0;
ingrediente=0;
   
	
	//agua y espresso 2 segundos
	reset=1; #10
ingrediente = 1; bebida = 1 ; reset =0; #60;
//assert (salida === 1) else $error("agua y espresso debería ser 01 (2s)");
	
	reset=1; #10
	//agua y moccha 1 segundo
	ingrediente = 1; bebida = 8;reset=0; #60;
	
	reset=1; #10
	//cafe y espresso 3 segundos
	ingrediente = 3; bebida = 1;reset=0; #60;
	
	reset=1; #10
	//leche y espresso 0 segundos
	ingrediente = 1; bebida = 8;reset=0; #60;
	
	reset=1; #10
	//caso default
	ingrediente = 2; bebida = 7; reset=0; #60;
	
	
	end
	
	always  #1 clk = ~clk;
endmodule