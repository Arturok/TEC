module mux4(input logic [23:0] r1, r2, r3, r4,
				input logic [1:0] s,
				output logic [23:0] color);
			always_comb
				if 		(s == 'b00) color <= r1;
				else if  (s == 'b01) color <= r2;
				else if  (s == 'b10) color <= r3;
				else 						color <= r4;
			
endmodule
		
		
		
			