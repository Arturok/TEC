module Mux8x1_tb();
	
	logic [31:0] f0, f1, f2, f3, f4, f5, f6, f7, y;
	logic [2:0] s;
	
	Mux8x1 DUT (f0, f1, f2, f3, f4, f5, f6, f7, s, y);
	
	initial begin
	f0 = 32'd10; f1 = 32'd11; f2 = 32'd12; f3 = 32'd13; f4 = 32'd14; 
			f5 = 32'd15; f6 = 32'd16; f7 = 32'd17; s = 3'd0; #10

	assert (y === 32'd10) else $error("000 failed.");

			
	s = 3'd1; #10

	assert (y === 32'd11) else $error("000 failed.");

	s = 3'd2; #10

	assert (y === 32'd12) else $error("000 failed.");

	s = 3'd3; #10

	assert (y === 32'd13) else $error("000 failed.");

	s = 3'd4; #10

	assert (y === 32'd14) else $error("000 failed.");

	s = 3'd5; #10

	assert (y === 32'd15) else $error("000 failed.");

	s = 3'd6; #10

	assert (y === 32'd16) else $error("000 failed.");


	s = 3'd7; #10

	assert (y === 32'd17) else $error("000 failed.");
	
	end 
	endmodule