module multiplicador (
	input logic [11:0] a,
	input logic [11:0] b,
	output logic [31:0] s
);

	assign s = a*b;
	
endmodule