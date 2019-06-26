module adder_tb ();
	logic [31:0] input_a;
	logic [31:0] input_b;
	logic [31:0] output_s;

	adder DUT(input_a, input_b, output_s);

	initial begin
		input_a = 32'd190; input_b = 32'd200; #10;
		assert (output_s === 32'd390) else $error("000 failed.");

		input_a = 32'd19; input_b = 32'd20; #10;
		assert (output_s === 32'd39) else $error("000 failed.");


	end
endmodule