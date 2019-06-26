module multiplicador_tb ();
	logic [7:0] input_a;
	logic [7:0] input_b;
	logic [15:0] output_s;

	multiplicador DUT(input_a, input_b, output_s);

	initial begin
		input_a = 8'd8; input_b = 8'd2; #10;
		assert (output_s === 16'd16) else $error("000 failed.");

		input_a = 8'd16; input_b = 8'd2; #10;
		assert (output_s === 16'd32) else $error("000 failed.");

		input_a = 8'd3; input_b = 8'd4; #10;
		assert (output_s === 16'd12) else $error("000 failed.");

	end
endmodule