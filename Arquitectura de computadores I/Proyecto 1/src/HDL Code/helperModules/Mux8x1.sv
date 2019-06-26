module Mux8x1 #(parameter N = 32)(
	input [N-1:0]  f0, f1, f2, f3, f4, f5, f6, f7,
	input [2:0] s, 
	output [N-1:0] y);

	assign y = s[2]? (s[1]?(s[0]?f7:f6):(s[0]?f5:f4)) : (s[1]?(s[0]?f3:f2):(s[0]?f1:f0)); 

endmodule
