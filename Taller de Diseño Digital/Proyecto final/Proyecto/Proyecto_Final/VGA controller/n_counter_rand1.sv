module n_counter_rand1 (input  logic clk,reset, 
							output logic [3:0] q);

always_ff @(posedge clk)
if (reset) q <= 4'd2;
else q <= q + 4'd3;

endmodule