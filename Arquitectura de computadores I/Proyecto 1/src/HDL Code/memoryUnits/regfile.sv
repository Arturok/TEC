module regfile(input logic clk,
					input logic we3,
					input logic [4:0] ra1, ra2, wa3,
					input logic [31:0] wd3,
					output logic [31:0] rd1, rd2, cr, hr, fp);
					
logic [31:0] rf[31:0];

// three ported register file
// read two ports combinationally
// write third port on rising edge of clock
// register 15 reads PC + 8 instead
always_ff @(posedge clk)
	
	if (we3) begin //Si el write eneable está activo, trate de escribir
		
		if(wa3 != 5'b00000) rf[wa3] <= wd3; //Escriba si el registro es diferente a la posición cero.
	 	
		else rf[5'b00000] <= 32'd0; //Registro cero tiene valor constante cero

	end
	
assign rd1 = rf[ra1]; //asignar el valor de la dirección a rd1
assign rd2 = rf[ra2]; //asignar el valor de la dirección a rd1
// Salidas especiales del set de registros
assign cr = rf[5'b00001];
assign hr = rf[5'b00100];
assign fp = rf[5'b11110];

endmodule