module Comparador_tb ();
	logic [31:0] input_a;
	logic [31:0] input_b;
	logic output_s;

	Comparador DUT(input_a, input_b, output_s);

	initial begin
		input_a = 32'd190; input_b = 32'd200; #10; // Comprueba si son diferentes y coloca 0
		assert (output_s === 1'b0) else $error("000 failed.");

		input_a = 32'd19; input_b = 32'd19; #10; // Comprueba si son iguales y coloca 1
		assert (output_s === 1'b1) else $error("000 failed.");


	end
endmodule