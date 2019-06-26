module regfile_tb ();
	logic clk;
    logic we3;
	logic [4:0] ra1, ra2, wa3;
	logic [31:0] wd3;
	logic [31:0] rd1, rd2, cr, hr, fp;

	regfile DUT(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2, cr, hr, fp);


	initial begin
		//Write 100 in $vr register
		#5 clk = 1'd1; we3 = 1'd1; ra1 = 5'd5; ra2 = 5'd7; wa3 = 5'd5; wd3 = 32'd100; #10

		//Write 200 in $a1 register
		we3 = 1'd1; ra1 = 5'd5; ra2 = 5'd7; wa3 = 5'd7; wd3 = 32'd200; #10

		//Confirm that the registers has been written successfully and the it is not written when the signal we3 is not active
		we3 = 1'd0; ra1 = 5'd5; ra2 = 5'd7; wa3 = 5'd7; wd3 = 32'd300; #10 //The constant 300 shouldn't be writte in a1
		assert (rd1 == 32'd100 & rd2 == 32'd200) else $error("Writting check: failed."); 

		//Write 101 in $cr register
		we3 = 1'd1; ra1 = 5'd1; ra2 = 5'd4; wa3 = 5'd1; wd3 = 32'd101; #10

		//Write 202 in $hr register
		we3 = 1'd1; ra1 = 5'd1; ra2 = 5'd4; wa3 = 5'd4; wd3 = 32'd202; #10

		//Write 303 in $fp register
		we3 = 1'd1; ra1 = 5'd1; ra2 = 5'd30; wa3 = 5'd30; wd3 = 32'd303; #10
		
		//checking that the special registers reading is successfully
		we3 = 1'd0; ra1 = 5'd1; ra2 = 5'd4; wa3 = 5'd4; wd3 = 32'd404; #10 //The constant 404 shouldn't be writte in hr
		assert (cr == 32'd101 & hr == 32'd202 & fp == 32'd303) else $error("Reading special registers check: failed."); 

		//Check that the register 0 has a zero constant value
		we3 = 1'd1; ra1 = 5'd0; ra2 = 5'd1; wa3 = 5'd0; wd3 = 32'd102; #10
		assert (rd1 == 32'd0) else $error("The zero register has value of zeroand it's constant: failed.");  
	end

	always 
		#5 clk = ~clk;

endmodule