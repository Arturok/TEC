module SignExtend(
	input logic [15:0] Imm,
	input logic [4:0] shamt,
	output logic [31:0] ExtImm, ExtShamt);


assign ExtShamt = {27'b0, shamt};		
always_comb
	
	if(Imm[15]==1'd0) begin //Verifica que el bit más significativo sea 0
	 	ExtImm = {16'b0, Imm}; //Extiende el signo con 0's
	end
	else begin //Si el bit más significativo es 1
		ExtImm = {16'b1, Imm}; //Extiende el signo con 1's
	end


	
endmodule