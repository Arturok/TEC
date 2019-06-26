module ControlUnit (
	input logic Comp,
	input logic [5:0] OpCode, Funct,
	output logic [1:0] PCSrcD,
	output logic [3:0] InstrType, AluControlD,
	output logic ShamtMuxCtrl ,BranchTaken, SetInstr, MemtoRegD,
	RegSrcD, MemWriteD, MemAddSrcD, BSrcD, ASrcD, MultSrcD, 
	SumSrcBD, SumSrcAD, MemRegwbAddr, WeWB);

/*
Controls:
controls[0] = MemRegwbAddr;
controls[1] = WeWB;
controls[3:2] = PCSrcD[1:0];
controls[4] = SumSrcAD;
controls[5] = SumSrcBD;
controls[6] = MultSrcD;
controls[7] = ASrcD;
controls[8] = BSrcD;
controls[12:9] = AluControlD[3:0];
controls[13] = MemAddSrcD;
controls[17:14] = InstrType[3:0];
controls[18] = MemWriteD;
controls[19] = RegSrcD;
controls[20] = MemtoRegD; 
controls[21] = SetInstr;
controls[22] = BranchTaken;
controls[23] = ShamtMuxCtrl;
 */
logic [23:0] controls;

always_comb begin

	/*Verificar que el opcode es cero, para así poder
	identificar cada instrucción por funct */
	if(OpCode == 0) begin

		casex(Funct)

			//Verificar si la instrucción es add
			6'd1: controls = 24'b000010000000000000001111;

			//Verificar si la instrucción es and
			6'd2: controls = 24'b000010000000010000001111;

			//Verificar si la instrucción es nor
			6'd3: controls = 24'b000010000000100000001111;

			//Verificar si la instrucción es or
			6'd4: controls = 24'b000010000000011000001111;

			
			//Verificar si la instrucción es slt
			6'd5: controls = 24'b001010000000001000001111;

			//Verificar si la instrucción es sll
			6'd6: controls = 24'b100010000100110000001111;

			//Verificar si la instrucción es srl
			6'd7: controls = 24'b100010000100111000001111;

			//Verificar si la instrucción es sub
			6'd8: controls = 24'b000010000000001000001111;

			//Valor default
			default: controls = 24'b000000000000000000001101;

		endcase
	end 

	//Case para clasificar las instrucciones por su opcode
	else begin

		casex(OpCode)

			//Verificar si la instrucción es addi
			6'd1: controls = 24'b000000000100000000001111;

			//Verificar si la instrucción es beq
			6'd3: begin
				//si rs = rt
				if(Comp == 1) begin
					controls = 24'b010000011100000000000101;

				//si rs != rt
				end else begin
					controls = 24'b000000011100000000001101;
				end
			end

			//Verificar si la instrucción es bne
			6'd4: begin
				//si rs != rt
				if(Comp == 0) begin
					controls = 24'b010000011100000000000101;

				//si rs = rt
				end else begin
					controls = 24'b000000011100000000001101;
				end
			end

			//Verificar si la instrucción es j
			6'd5: controls = 24'b010000010000000000001001;

			//Verificar si la instrucción es jal
			6'd6: controls = 24'b010000010100000000001010;

			//Verificar si la instrucción es lw
			6'd7: controls = 24'b000100001010000000001111;
			
			//Verificar si la instrucción es slti
			6'd9: controls = 24'b001000000100001000001111;

			//Verificar si la instrucción es sw
			6'd10: controls = 24'b000101001110000000001101;

			//Verificar si la instrucción es mpp
			6'd12: controls = 24'b000010100000000110111111;

			//Verificar si la instrucción es mppi
			6'd13: controls = 24'b000010100100000111011111;

			//Verificar si la instrucción es ppxl
			6'd14: controls = 24'b000001001110000000001101;

			//Verificar si la instrucción es ptmu
			6'd15: controls = 24'b000001101100001000001111;

			//Verificar si la instrucción es ptml
			6'd16: controls = 24'b000001101000001010001111;

			//Verificar si la instrucción es ptmd
			6'd17: controls = 24'b000001101100000000001111;

			//Verificar si la instrucción es ptmr
			6'd18: controls = 24'b000001101000000000001111;

//Esto porque la desición de que dato operar la toma la unidad de forward

			//Verificar si la instrucción es ppxlc
			6'd19: controls = 24'b000001110010000110111101;


			//Verificar si la instruccion es pmpxl
			6'd20: controls = 24'b000011110010000110111111;

/*Falta implementar clear screen*/

			//Verificar si la instrucción es jr
			6'd24: controls = 24'b010010011000000000000001;

			//Valor default
			default: controls = 24'b000000000000000000001101;

		endcase 
	end
end

assign { ShamtMuxCtrl, BranchTaken, SetInstr, MemtoRegD, RegSrcD,
MemWriteD, InstrType, MemAddSrcD, AluControlD, BSrcD, ASrcD,
MultSrcD, SumSrcBD, SumSrcAD, PCSrcD, WeWB, MemRegwbAddr} = controls;

endmodule