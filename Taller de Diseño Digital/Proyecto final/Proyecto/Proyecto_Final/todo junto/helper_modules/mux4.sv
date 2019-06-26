module mux4 #(parameter N=8) (input logic [N-1:0] A, B, C, D,
					input logic [1:0] S,
					output logic [N-1:0] Y);
					
always_comb
case (S)
	2'b00: Y<=A;
	2'b01: Y<=B;
	2'b10: Y<=C;
	2'b11: Y<=D;
	default: Y<=A;	
endcase
endmodule
