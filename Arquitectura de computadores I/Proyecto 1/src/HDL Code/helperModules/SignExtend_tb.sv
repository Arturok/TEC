module SignExtend_tb ();
	logic [15:0] Imm;
	logic [31:0] ExtImm;

	SignExtend DUT(Imm, ExtImm);

	initial begin
		Imm = 16'b0000000000000001; #10; //Verifica y si todo esta bien extiende el signo con 0's
		assert (ExtImm === 32'b00000000000000000000000000000001) else $error("000 failed.");

		Imm = 16'b1000000000000001; #10; //Verifica y si todo esta bien extiende el signo con 1's
		assert (ExtImm === 32'b11111111111111110000000000000001) else $error("000 failed.");


	end
endmodule