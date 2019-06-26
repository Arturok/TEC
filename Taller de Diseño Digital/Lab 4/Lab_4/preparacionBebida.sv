module preparacionBebida(input  logic clk,
								 input  logic reset,
								 input  logic prepBebida,
								 input  logic tiempoPasado,
								 output logic finBebida, Agua, Cafe, Leche, Chocolate, Azucar,
								 output logic [3:0] Estado);
								 
		typedef enum logic[3:0] {B0, A, C, L, Ch, Az, R1, R2, R3, R4, R5} statetype;
		statetype state, nextstate;
		
		//State register
		always_ff @(posedge clk, posedge reset)
			if (reset) 			state <= B0;
			else 					state <= nextstate;
		//Next state logic
		always_comb
			case (state)
				B0:	nextstate = prepBebida	 ? A  : B0;
				A:		nextstate = tiempoPasado ? R1 : A;
				R1:	nextstate = tiempoPasado ? R1 : C;
				C:		nextstate = tiempoPasado ? R2 : C;
				R2:	nextstate = tiempoPasado ? R2 : L;
				L:		nextstate = tiempoPasado ? R3 : L;
				R3:	nextstate = tiempoPasado ? R3 : Ch;
				Ch:	nextstate = tiempoPasado ? R4 : Ch;
				R4:	nextstate = tiempoPasado ? R4 : Az;
				Az:	nextstate = tiempoPasado ? R5 : Az;
				R5:	nextstate = tiempoPasado ? R5 : B0;
			endcase
			
		//output logic
		assign Estado = state;
		assign finBebida = (state==R5);
		assign Agua = (state==A);
		assign Cafe = (state==C);
		assign Leche = (state==L);
		assign Chocolate = (state==Ch);
		assign Azucar = (state==Az);
		
endmodule
		
								 