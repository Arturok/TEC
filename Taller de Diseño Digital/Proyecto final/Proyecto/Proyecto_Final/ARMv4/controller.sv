module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlags,
						input logic Interrupt,
						output logic [1:0] RegSrc,
						output logic RegWrite,
						output logic [1:0] ImmSrc,
						output logic ALUSrc,
						output logic [1:0] ALUControl,
						output logic MemWrite, MemtoReg,
						output logic [1:0] PCSrc,
						output logic IntReset);
						
logic [1:0] FlagW;
logic [1:0]PCS;
logic RegW, MemW;

decoder dec(Instr[27:26], Instr[25:20], Instr[15:12], Interrupt,
			FlagW, PCS, RegW, MemW,MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, IntReset);
			
			
condlogic cl(clk, reset, Instr[31:28], ALUFlags, FlagW, PCS, RegW, MemW,
					PCSrc, RegWrite, MemWrite);
					
					
endmodule