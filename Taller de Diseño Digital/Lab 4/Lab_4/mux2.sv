module mux2 #(parameter N = 4)(input logic [N - 1:0] d0,
										input logic [N - 1:0] d1,
										input logic S,
										output logic [N-1:0] Y);

assign Y = S ? d1 : d0; 
endmodule