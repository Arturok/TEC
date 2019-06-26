module imem(input logic [31:0] a,
				output logic [31:0] ir);
				
logic [31:0] RAM[22:0];

initial
	// $readmemh("memfile.dat", RAM);
	$readmemh("testCodeH.dat", RAM);
assign ir = RAM[a[31:2]]; // word aligned

endmodule
