module selectorCuadrante_tb();



logic [9:0] hcnt, vcnt;
logic [1:0] selector;
//always #1 vgaclk = ~vgaclk;


// instantiate device under test
selectorCuadrante dut(hcnt, vcnt, selector);

initial begin

//Cuadrante 1
hcnt=215; vcnt=100; #10;
//hcnt=10'b11010111; vcnt=10'b01100100; #10;
assert (selector === 2'b00) else $error("Error al seleccionar el cuadrante 1");

//Cuadrante 2
hcnt=333; vcnt=100; #10;
//hcnt=10'b0101001101; vcnt=10'b01100100; #10;
assert (selector === 2'b01) else $error("Error al seleccionar el cuadrante 2");

//Cuadrante 3
hcnt=215; vcnt=272; #10;
//hcnt=10'b11010111; vcnt=10'b0100010000;
assert (selector === 2'b10) else $error("Error al seleccionar el cuadrante 3");

//Cuadrante 4
hcnt=333; vcnt=272; #10;
//hcnt=10'b0101001101;; vcnt=10'b0100010000;
assert (selector === 2'b11) else $error("Error al seleccionar el cuadrante 4");


end

endmodule
