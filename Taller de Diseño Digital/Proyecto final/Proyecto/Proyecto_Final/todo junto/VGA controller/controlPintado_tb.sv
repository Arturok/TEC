module controlPintado_tb();

logic clk = 0, reset, boton, reg1, reg2, reg3, reg4;
always #1 clk = ~clk;
controlPintado dut(clk, reset, boton, reg1, reg2, reg3, reg4);

initial begin

reset=1; boton = 0; #1 reset=0; #4;
assert (reg1 === 1) else $error("Error maquina de estados no ha iniciado");

boton = 1; #4;
assert (reg1 === 1) else $error("Error en el cuadrante 1");

boton = 0; #4;

assert (reg2 === 1) else $error("Error en el cuadrante 1");

boton = 1; #4;

assert (reg2 === 1) else $error("Error en el cuadrante 2");

boton = 0; #4;

assert (reg3 === 1) else $error("Error en el cuadrante 3");

boton = 1; #4;

assert (reg3 === 1) else $error("Error en el cuadrante 3");

boton = 0; #4;

assert (reg4 === 1) else $error("Error en el cuadrante 4");

reset=1; #1 reset=0; boton = 0; #4;

assert (reg1 === 1) else $error("No aplica bien el reset");

boton = 1; #4;

assert (reg1 === 1) else $error("Error en el cuadrante 1");

boton = 0; #4;

assert (reg2 === 1) else $error("Error en el cuadrante 2");

end


		
endmodule 