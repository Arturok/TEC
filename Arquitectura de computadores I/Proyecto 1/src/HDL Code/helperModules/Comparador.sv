module Comparador #(parameter N = 32)(
		input logic [N-1:0] a, b, 
		output logic s
	);

	always_comb
		if(a === b) begin //Si ambos datos son iguales, la salida cambia a 1
			s = 1'b1;
		end
		else begin
			s = 1'b0; //Si ambos datos son distintos, cambia a 0
		end

endmodule // Comparador