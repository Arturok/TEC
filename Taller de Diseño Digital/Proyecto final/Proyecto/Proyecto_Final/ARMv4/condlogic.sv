module condlogic(input logic clk, reset,
					input logic [3:0] Cond,
					input logic [3:0] ALUFlags,
					input logic [1:0] FlagW,
					input logic [1:0] PCS, 
					input logic RegW, MemW,
					output logic [1:0] PCSrc,
						output logic RegWrite, MemWrite);
					
logic [1:0] FlagWrite;
logic [3:0] Flags;
logic CondEx;
//zero[3], neg[2]
flopenr #(2)flagreg1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);

//carry[1] and overflow[0]
flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

// write controls are conditional
condcheck cc(Cond, Flags, CondEx);

assign FlagWrite = FlagW & {2{CondEx}};
assign RegWrite = RegW & CondEx;
assign MemWrite = MemW & CondEx;

//assign PCSrc = PCS & CondEx;
always_comb
if (CondEx) PCSrc = PCS;
else PCSrc = 2'b0;

endmodule


module condcheck(input logic [3:0] Cond,
					input logic [3:0] Flags,
					output logic CondEx);
					
logic neg, zero, bcarry, overflow, ge;

assign {neg, zero, bcarry, overflow} = Flags;
assign ge = (neg == overflow);

always_comb
	case(Cond)
		4'b0000: CondEx = zero; // EQ
		4'b0001: CondEx = ~zero; // NE
		4'b0010: CondEx = bcarry; // CS
		4'b0011: CondEx = ~bcarry; // CC
		4'b0100: CondEx = neg; // MI
		4'b0101: CondEx = ~neg; // PL
		4'b0110: CondEx = overflow; // VS
		4'b0111: CondEx = ~overflow; // VC
		4'b1000: CondEx = bcarry & ~zero; // HI
		4'b1001: CondEx = ~(bcarry & ~zero); // LS
		4'b1010: CondEx = ge; // GE
		4'b1011: CondEx = ~ge; // LT
		4'b1100: CondEx = ~zero & ge; // GT
		4'b1101: CondEx = ~(~zero & ge); // LE
		4'b1110: CondEx = 1'b1; // Always
		default: CondEx = 1'bx; // undefined
	endcase
	
endmodule