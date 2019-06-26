   
module Mux4x1_tb ();

    logic [31:0] f0, f1, f2, f3, y;
	logic [1:0] s;
	
	Mux4x1 DUT (f0, f1, f2, f3, s, y);
	
	initial begin
	f0 = 32'd10; f1 = 32'd11; f2 = 32'd12; f3 = 32'd13; s = 2'd0; #10

	assert (y === 32'd10) else $error("000 failed.");

			
	s = 2'd1; #10

	assert (y === 32'd11) else $error("000 failed.");

	s = 2'd2; #10

	assert (y === 32'd12) else $error("000 failed.");

	s = 2'd3; #10

	assert (y === 32'd13) else $error("000 failed.");
	
	end 
	endmodule
