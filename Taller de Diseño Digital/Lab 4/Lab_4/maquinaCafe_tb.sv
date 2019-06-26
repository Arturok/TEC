module maquinaCafe_tb();

logic [3:0] in_bebida;
logic moneda100, moneda500, cancelar, clk, reset;
logic Agua, Cafe, Leche, Chocolate, Azucar;
logic [6:0] pantalla; 

maquinaCafe dut(in_bebida, moneda100, moneda500, cancelar, clk, reset, Agua, Cafe, Leche, Chocolate, Azucar, pantalla);

initial begin

in_bebida=0000; moneda100=0; moneda500=1; cancelar=0;clk=0 ; reset=1; #10;

assert(Agua === 0) else $error("Para in_bebida=0000 Agua debe ser 0");
assert(Cafe === 0) else $error("Para in_bebida=0000 Cafe debe ser 0");
assert(Leche === 0) else $error("Para in_bebida=0000 Leche debe ser 0");
assert(Chocolate === 0) else $error("Para in_bebida=0000 Chocolate  debe ser 0");
assert(Azucar === 0) else $error("Para in_bebida=0000 Azucar  debe ser 0");
assert(pantalla === 'b1101101) else $error("Para in_bebida=0000 pantalla debe ser 1101101");

end 

always  #1 clk = ~clk;
endmodule				