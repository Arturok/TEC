module BichitoYposReg #(parameter WIDTH = 8, 
								BASE_YPOS = 10'd240)
					(input logic clk, reset, en,
					input logic [WIDTH-1:0] d,
					output logic [WIDTH-1:0] q);
					
always_ff @(posedge clk, posedge reset)
	if (reset) q <= BASE_YPOS;
	else if (en) q <= d;
endmodule