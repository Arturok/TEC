module Flopenr_tb ();
	logic clk, reset, en;
	logic [31:0] d;
	logic [31:0] q;

	Flopenr DUT(clk, reset, en, d, q);

	initial begin
		clk = 1'd0; reset =1'd0; en = 1'd1; d = 32'd127; q = 32'd0; #10

		assert(q === 32'd127) else $error("000 failed.");

		reset =1'd0; en = 1'd0; d = 32'd128; #10

		assert(q === 32'd127) else $error("000 failed.");

		reset =1'd0; en = 1'd1; d = 32'd128; #10

		assert(q === 32'd128) else $error("000 failed.");

		reset =1'd1; en = 1'd1; d = 32'd128; #10

		assert(q === 32'd0) else $error("000 failed.");

		reset =1'd1; en = 1'd0; d = 32'd128; #10

		assert(q === 32'd0) else $error("000 failed.");

	end

	always 
		#5 clk = ~clk;

endmodule