module datapath(input logic clk, reset,
					input logic [1:0] RegSrc,
					input logic RegWrite,
					input logic [1:0] ImmSrc,
					input logic ALUSrc,
					input logic [1:0] ALUControl,
					input logic MemtoReg,
					input logic [1:0] PCSrc,
					output logic [3:0] ALUFlags,
					output logic [31:0] PC,
					input logic [31:0] Instr,
					output logic [31:0] ALUResult, WriteData,
					input logic [31:0] ReadData);
					
logic [31:0] PCNext, PCPlus4, PCPlus8;
logic [31:0] ExtImm, SrcA, SrcB, Result, IntAddr;
logic [3:0] RA1, RA2, alu_cont;


assign IntAddr = 32'h88;


// next PC logic
//mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
mux4 #(32) pcmux(PCPlus4, Result, IntAddr, 32'b0, PCSrc, PCNext);

flopr #(32) pcreg(clk, reset, PCNext, PC);
adder #(32) pcadd1(PC, 32'b100, PCPlus4);
adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);

// register file logic
//muxes that select register address signal for RA1 and RA2
mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);


regfile rf(clk, RegWrite, RA1, RA2, Instr[15:12], Result, PCPlus8,
				SrcA, WriteData);
				
mux2 #(32) resmux(ALUResult, ReadData, MemtoReg, Result);

extend ext(Instr[23:0], ImmSrc, ExtImm);


// ALU logic
mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
alu #(32) alu(SrcA, SrcB, alu_cont, ALUResult, ALUFlags);

assign alu_cont = {2'b0, ALUControl};

endmodule