module selectorCuadrante #(parameter HC2 = 10'd635,
												HC1 = 10'd317,
												VC1 = 10'd240,
												VC2 = 10'd480,
												C1 = 2'b00,
												C2 = 2'b01,
												C3 = 2'b10,
												C4 = 2'b11)
(input logic [9:0] hcnt, vcnt,
output logic [1:0] selector);

always_comb 

if(vcnt < VC1) begin//we are on the top part of the screen
	if(hcnt < HC1) selector = C1;
	else selector = C2;

end else begin//we are at the bottom part
	if(hcnt < HC1) selector = C3;
	else selector = C4;
end
//
//if ((hcnt < HC1) & (vcnt < VC1)) selector = C1; //cuadrante 1
//else if ((hcnt > HC1) & (vcnt < VC1)) selector = C2; //cuadrante 2
//else if ((hcnt < HC1) & (vcnt > VC1)) selector = C3; //cuadrante 3
//else  selector = C4; //cuadrante 1  rem- if ((hcnt < HC1) & (vcnt > VC1))
//else selector = C1;  //por defecto estamos en el cuadrante 1


endmodule