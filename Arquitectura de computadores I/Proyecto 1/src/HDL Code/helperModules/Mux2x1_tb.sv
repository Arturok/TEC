module Mux2x1_tb ();
	logic [31:0] d0, d1;
	logic s;
	logic [31:0] y;

	Mux2x1 DUT(d0, d1, s, y);

	initial begin

		d0 = 32'd10; d1 = 32'd11; s = 1'b0; #10;
		assert (y === 32'd10) else $error("000 failed.");

		d0 = 32'd10; d1 = 32'd11; s = 1'b1; #10;
		assert (y === 32'd11) else $error("000 failed.");

	end
endmodule