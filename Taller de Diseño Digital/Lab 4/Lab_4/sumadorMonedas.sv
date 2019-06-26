module sumadorMonedas #(parameter N = 4)
(input logic moneda100, moneda500, clk, reset,
output logic [N-1:0] suma);
always_ff @(posedge clk, posedge reset)
		if (reset) suma <= 0;
		else  if(moneda500) suma <= suma + 5;
		else suma <= suma + 1;
endmodule