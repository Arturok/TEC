module ObsXposReg #(parameter WIDTH = 8, 
								BASE_XPOS = 10'd634)
					(input logic clk, reset, en,
					input logic [WIDTH-1:0] d,
					output logic [WIDTH-1:0] q);
					
always_ff @(posedge clk, posedge reset)

	if (reset) q <= BASE_XPOS;
	else if (en) q <= d;
	
endmodule