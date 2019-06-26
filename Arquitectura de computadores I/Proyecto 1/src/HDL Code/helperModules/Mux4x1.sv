module Mux4x1 #(parameter N = 32)(
	input logic [N-1:0]  f0, f1, f2, f3,
	input logic [1:0] s, 
	output logic [N-1:0] y);

	assign y = s[1]?(s[0]?f3:f2):(s[0]?f1:f0); 

endmodule

   