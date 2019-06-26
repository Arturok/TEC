module seleccionTiempo_tb();

logic [3:0] bebida, ingrediente;
logic [1:0] salida;

seleccionTiempo dut(ingrediente, bebida, salida);

initial begin

ingrediente = 1; bebida = 1; #10;
assert (salida === 1) else $error("agua y espresso debería ser 01 (2s)");

ingrediente = 1; bebida = 2; #10;
assert (salida === 1) else $error("agua y cafeconLeche debería ser 01 (2s)");

ingrediente = 1; bebida = 8; #10;
assert (salida === 2) else $error("agua y chocolate debería ser 10 (1s)");


ingrediente = 3; bebida = 1; #10;
assert (salida === 0) else $error("cafe y espresso debería ser 00 (3s)");

ingrediente = 3; bebida = 4; #10;
assert (salida === 2) else $error("cafe y capuccino debería ser 10 (1s)");

ingrediente = 5; bebida = 1; #10;
assert (salida === 3) else $error("leche y espresso debería ser 11 (0s)");

ingrediente = 5; bebida = 4; #10;
assert (salida === 2) else $error("leche y capuccino debería ser 10 (2s)");

//caso default
ingrediente = 4; bebida = 0; #10;
assert (salida === 3) else $error("caso default debería ser 11 (0s)");

end

endmodule
