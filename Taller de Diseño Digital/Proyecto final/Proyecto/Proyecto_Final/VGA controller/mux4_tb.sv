module mux4_tb();

logic [23:0] r1, r2, r3, r4, color;
logic [1:0] s;

mux4 dut(r1, r2, r3, r4, s, color);

//Primer cuadrante
initial begin
r1='b000000000000000000000000; r2='b000000000000111111111111;
r3='b111111111111000000000000; r4='b111111111111111111111111;
s = 'b00; #20;
assert (color === 'b000000000000000000000000) else $error("Error en seleccionar el primer cuadrante");


//Segundo cuadrante
r1='b000000000000000000000000; r2='b000000000000111111111111;
r3='b111111111111000000000000; r4='b111111111111111111111111;
s = 'b01;  #20;
assert (color === 'b000000000000111111111111) else $error("Error en seleccionar el segundo cuadrante");



//Tercero cuadrante
r1='b000000000000000000000000; r2='b000000000000111111111111;
r3='b111111111111000000000000; r4='b111111111111111111111111;
s = 'b10; #20;
assert (color === 'b111111111111000000000000) else $error("Error en seleccionar el tercer cuadrante");



//Cuarto cuadrante
r1='b000000000000000000000000; r2='b000000000000111111111111;
r3='b111111111111000000000000; r4='b111111111111111111111111;
s = 'b11; #20;
assert (color === 'b111111111111111111111111) else $error("Error en seleccionar el cuarto cuadrante");


end

endmodule



