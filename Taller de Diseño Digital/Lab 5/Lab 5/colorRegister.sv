module colorRegister (input logic [23:0] D,
							 input logic clk, reset,
							 output logic [23:0] Q);
							 
		always_ff @(negedge clk, posedge reset)
		if (reset) Q <= 'b0;
		else Q <= D;
		
endmodule
