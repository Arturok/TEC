module dmem_tb();

logic clk, we;
logic [31:0] a, wd, rd;

// instantiate device under test
dmem dut(clk, we, a, wd, rd);

initial begin
//Writing 100 on pos 0 
#5 clk=1'b1; we=1'b1; a=32'd0; wd=32'd100; #10

//Reading the value on pos 0
we=1'b0; a=32'd0; wd=32'd200; #10
assert (rd === 32'd100) else $error("Error reading pos 0");


//Writing 200 on pos 4
we=1'b1; a=32'd4; wd=32'd200; #10

//Reading the value on pos 4, wd=400 but shouldn't be written
we=1'b0; a=32'd4; wd=32'd400; #10
assert (rd === 32'd200) else $error("Error reading pos 4");


//Rewriting pos 0 with 400
#5 clk=1'b1; we=1'b1; a=32'd0; wd=32'd400; #10

//Reading the new value on pos 0, wd=200 but shouldn't be written
we=1'b0; a=32'd0; wd=32'd200; #10
assert (rd === 32'd400) else $error("Error reading the new value pos 0");




end
always 
		#5 clk = ~clk;

endmodule 