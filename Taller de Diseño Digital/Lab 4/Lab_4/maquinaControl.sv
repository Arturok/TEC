module maquinaControl(input  logic cantDinero, finBebida, sufDinero, cancelarBebida,
							 input  logic clk,reset,
							 output logic prepBebida, darVuelto);
								 
		typedef enum logic[1:0] {E0, E1, E2} statetype;
		statetype state, nextstate;
		
		//State register
		always_ff @(posedge clk, posedge reset)
			if (reset) 			state <= E0;
			else 					state <= nextstate;
		//Next state logic
		always_comb
			case (state)
				E0:	nextstate = cantDinero ? E1 : E0;
				E1:	nextstate = cancelarBebida  ? E0 : (sufDinero ? E2 : E1);
				E2:	nextstate = finBebida  ? E0 : E2;
			endcase
			
		//output logic
		assign prepBebida = (state == E2);
		assign darVuelto  = (state == E2);
		

		
endmodule