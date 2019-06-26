module tiempoIngrediente ( input logic [3:0] ingrediente,
input logic [3:0] bebida,
input logic clk, reset, 
output logic tiempoPasado);

logic [31:0] count;
logic temp1s, temp2s, temp3s;
logic [1:0] selTemp;

cont_n #(32) clockdivider(clk, reset, count);

assign  temp1s = count[25]; //periodo 1 segundo
assign  temp2s = count[26]; //perido 2 segundos
assign  temp3s = count[27]; //periodo 3 segundos


seleccionTiempo tempSel(ingrediente, bebida, selTemp);

mux4 #(1) clockSelect(temp3s, temp2s, temp1s, 1'b1, selTemp, tiempoPasado);

endmodule

