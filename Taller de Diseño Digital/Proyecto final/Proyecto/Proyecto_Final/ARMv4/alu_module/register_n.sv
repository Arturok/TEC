module register_n #(parameter N=8)
						(input logic [N-1:0] D,
						input logic clk, reset,
						output [N-1:0] Q);

always_ff @ (posedge clk, posedge reset)
if (reset) Q <=  'b0;
	else    Q <= D;
endmodule
