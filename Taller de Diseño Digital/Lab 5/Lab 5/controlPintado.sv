module controlPintado(input logic clk,
							 input logic reset,
							 input logic boton,
							 output logic reg1, reg2, reg3, reg4);

		typedef enum logic[1:0] {E0, E1, E2, E3} statetype;
		statetype state, nextstate;
		logic boton_reg;
		
		//State register
		always_ff @(posedge clk, posedge reset)
			if (reset) begin
				state <= E0;
				boton_reg <= 0;
				end
			else 		begin
			state <= nextstate;
			boton_reg <= boton;
			end
			
		//nextstate Logic
		always_comb
//		always_ff @(negedge boton)
			case (state)
				E0: nextstate = (boton_reg == 1 & boton == 0) ? E1 : E0;
				E1: nextstate = (boton_reg == 1 & boton == 0)  ? E2 : E1;
				E2: nextstate = (boton_reg == 1 & boton == 0)  ? E3 : E2;
				E3: nextstate = (boton_reg == 1 & boton == 0)  ? E0 : E3;
//				E0: nextstate <= E1 ;
//				E1: nextstate <= E2 ;
//				E2: nextstate <=  E3 ;
//				E3: nextstate <= E0 ;
			endcase
		
		//Output logic
		assign reg1 = (state == E0);
		assign reg2 = (state == E1);
		assign reg3 = (state == E2);
		assign reg4 = (state == E3);
		
endmodule 