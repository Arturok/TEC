module ASIC (	input logic clk, reset,
               input logic [31:0] Instruction, memData,
               output logic memWrite,
               output logic [31:0] memAddr, wrData, nextPC
					);

/*
Importante 

*/

//control signals
logic Comp, stll_rstIFID;
// logic [3:0] AluFlags;
// logic [5:0] OpCode, Funct;
logic [1:0] PCSrcD;
logic [3:0] InstrType;
logic [3:0] AluControlD;
logic MemtoRegD, RegSrcD, MemWriteD, MemAddSrcD, BSrcD, ASrcD, MultSrcD, SumSrcBD, SumSrcAD, WBaddrSelect, We3, setInstr,ctr_ShamtMuxCtrl;

logic EXMEM_MemtoReg, EXMEM_MemAddrSrc, EXMEM_WBaddrSelect, EXMEM_We3;


logic IDEX_setInstr, IDEX_MemtoReg, IDEX_MemWrite, IDEX_MemAddrSrc, IDEX_WBaddrSelect, IDEX_We3;
logic [3:0] IDEX_InstrType;
logic [3:0] IDEX_ALUcontrol;
logic MWB_RegfileEn_We3;



logic MEMWB_MemtoReg, MEMWB_WBaddrSelect;
logic [3:0] MEMWB_InstrType;

//Forwarding
logic [1:0] compTopCtrl, compBotCtrl, addControl, multCtrl, FPadderCtrl, HRshiftCtrl;
logic [1:0] aluSrcA, aluSrcB, AluSrcBfrwdCtrl;
logic [1:0] memDwriteFrwdCtrl, muxJnLctrl;
logic frwdJnLJR;



//stall signals
// logic [3:0] decInstrType, exInstrType;
// logic [4:0] decRS, decRT, exRegDest;
logic stll_enPC, enIFID, rstIDEX, ctrl_rstIFID; 

//Reg Address signals
logic [4:0] mxWBA_wba_IDEX;
logic [4:0] IDEX_rs, IDEX_wba, IDEX_rt;
logic [4:0] MEMWB_wba;
logic [4:0] mxWBA_mxOut_Wa3;
logic [4:0] EXMEM_wba;
logic [3:0] EXMEM_InstrType;





//Data signals
logic [31:0] mxJR_jmpReg_mxPC, mxJnL_jmpReg_mxJR, sumDEC_branchAddr_mxPC, splc_jmpAddr_mxPC, sumIF_pc4_mxPC,   mxAsrc_A_IDEX, mxBsrc_B_IDEX, sgnExt_ExtShamt, muxSeiShmt_decImm, mxWBD_out_mxWBDpc, alu_ALUout;

logic [31:0] IFID_nextPC, mxPC_nextPC,  IFIDinstruction, sgnExt_sei, regFile_hr;

logic [31:0] IDEX_A, IDEX_B, IDEX_SEimm, IDEX_2hr, IDEX_nextPC, IDEX_RegFile_cr;

logic [31:0] mxWBD_writebackData_RegFile;

logic [31:0] RegFile_rd1, RegFile_rd2, RegFile_cr, RegFile_hr, RegFile_fp;

logic [31:0] mxALUout_AluOut_EXMEM, EXMEM_AluOut, mxFrw_FP_mxSumAdd, mxRSmvPP_2ShRS_SumBranch, mxSumA_A_BranchAdd, mxSumB_B_BranchAdd, EXMEM_RegFile_cr;

logic [31:0] MEMWB_ALUOut, MEMWB_MemRd, mxALUSrcA_A_ALU, mxALUSrcB_B_ALU, MEMWB_nextPC, afterFrwdB;

logic [31:0] EXMEM_A, EXMEM_B, EXMEM_nextPC;



//Comparator
logic [31:0] mxfrwCOMPRS_COMTop_COM, mxfrwCOMPRT_COMBot_COM;

//Multiplier
logic [31:0] mxfrwMultRT_MultRT_mxMultTOP, mxfrwMultHR_MultHR_mxMultBOT, mxMultTop_MultA_Mult, Mult_Res_mxB;







//Splice for Jump Address
assign splc_jmpAddr_mxPC = { IFID_nextPC [31:28], IFIDinstruction [25:0], 2'b00};



//Control Units			
ControlUnit ctrl (Comp, IFIDinstruction[31:26], IFIDinstruction[5:0], PCSrcD, InstrType, AluControlD, ctr_ShamtMuxCtrl,ctrl_rstIFID, setInstr, MemtoRegD, RegSrcD, MemWriteD, MemAddSrcD, BSrcD, ASrcD, MultSrcD, SumSrcBD, SumSrcAD, WBaddrSelect, We3);


stallUnit stll ( clk, ctrl_rstIFID, InstrType, IDEX_InstrType, IFIDinstruction [25:21], IFIDinstruction [20:16], IDEX_wba, stll_enPC, enIFID, rstIDEX, stll_rstIFID);

decfrd DECForwarding(InstrType, IDEX_InstrType, EXMEM_InstrType, IFIDinstruction [25:21], IFIDinstruction [20:16], IDEX_wba, EXMEM_wba, compTopCtrl, compBotCtrl, addControl, multCtrl,FPadderCtrl, HRshiftCtrl,muxJnLctrl,
    frwdJnLJR);

//Pipe Registers

//Decode ----------------------------------------------------------------------------------------------
IF_ID ifid ( clk, stll_rstIFID , enIFID, mxPC_nextPC, Instruction, IFID_nextPC, IFIDinstruction);


//Modules

Flopenr PC (clk, reset, stll_enPC  , mxPC_nextPC, nextPC);

adder PCAdder(nextPC, 32'd4, sumIF_pc4_mxPC);

regfile RegisterFile(clk, MWB_RegfileEn_We3, IFIDinstruction [25:21], IFIDinstruction [20:16], mxWBA_mxOut_Wa3,
     mxWBD_writebackData_RegFile, RegFile_rd1, RegFile_rd2, RegFile_cr, RegFile_hr, RegFile_fp);

SignExtend SignExt(IFIDinstruction[15:0], IFIDinstruction[10:6], sgnExt_sei, sgnExt_ExtShamt);

adder BranchAdd(mxSumA_A_BranchAdd, mxSumB_B_BranchAdd, sumDEC_branchAddr_mxPC);

Comparador Comparator3000(mxfrwCOMPRS_COMTop_COM, mxfrwCOMPRT_COMBot_COM, Comp);

multiplicador Mult(mxMultTop_MultA_Mult[11:0], {mxfrwMultHR_MultHR_mxMultBOT[9:0], 2'd0}, Mult_Res_mxB);



//Muxes

Mux2x1 muxJR (mxJnL_jmpReg_mxJR, IDEX_nextPC,frwdJnLJR, mxJR_jmpReg_mxPC);
Mux4x1 muxJnL (RegFile_rd1, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, muxJnLctrl,mxJnL_jmpReg_mxJR);
Mux4x1 muxPC (mxJR_jmpReg_mxPC, sumDEC_branchAddr_mxPC, splc_jmpAddr_mxPC, sumIF_pc4_mxPC, PCSrcD, mxPC_nextPC);

Mux2x1 #(5) muxWbaRegfile(5'd31, MEMWB_wba, MEMWB_WBaddrSelect, mxWBA_mxOut_Wa3);

Mux4x1 frwFP(RegFile_fp, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, FPadderCtrl, mxFrw_FP_mxSumAdd);
Mux4x1 frwRSmvPPDec(RegFile_rd1, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, addControl, mxRSmvPP_2ShRS_SumBranch);

Mux2x1 BranchSumA(IFID_nextPC, mxFrw_FP_mxSumAdd, SumSrcAD, mxSumA_A_BranchAdd);
Mux2x1 BranchSumB({sgnExt_sei [29:0], 2'b00}, {mxRSmvPP_2ShRS_SumBranch [29:0], 2'b00}, SumSrcBD, mxSumB_B_BranchAdd);

Mux4x1 frwCOMPRS(RegFile_rd1, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, compTopCtrl, mxfrwCOMPRS_COMTop_COM);
Mux4x1 frwCOMPRT(RegFile_rd2, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, compBotCtrl, mxfrwCOMPRT_COMBot_COM);

//Mult
Mux4x1 frwMultRT(RegFile_rd2, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, multCtrl, mxfrwMultRT_MultRT_mxMultTOP);
Mux4x1 frwMultHR(RegFile_hr, mxALUout_AluOut_EXMEM, EXMEM_AluOut, memData, HRshiftCtrl, mxfrwMultHR_MultHR_mxMultBOT);
Mux2x1 MultSrcA(mxfrwMultRT_MultRT_mxMultTOP, {22'd0, IFIDinstruction[25:16]}, MultSrcD, mxMultTop_MultA_Mult);

//DecSrc
Mux2x1 ADecSrc(RegFile_rd1, sumDEC_branchAddr_mxPC, ASrcD, mxAsrc_A_IDEX);
Mux2x1 BDecSrc(RegFile_rd2, Mult_Res_mxB, BSrcD, mxBsrc_B_IDEX);

Mux2x1 seimmShamt(sgnExt_sei, sgnExt_ExtShamt, ctr_ShamtMuxCtrl, muxSeiShmt_decImm);
Mux2x1 #(5) mxWBA (IFIDinstruction [20:16],IFIDinstruction [15:11], RegSrcD, mxWBA_wba_IDEX);


//Execute ----------------------------------------------------------------------------------------------
ID_EX idex (clk, rstIDEX, 1'b1, IFIDinstruction [25:21], mxWBA_wba_IDEX, IFIDinstruction [20:16], mxAsrc_A_IDEX , mxBsrc_B_IDEX,
          muxSeiShmt_decImm,{regFile_hr [29:0], 2'b00}, IFID_nextPC,RegFile_cr,
                    setInstr, MemtoRegD, MemWriteD, MemAddSrcD, WBaddrSelect, We3, 
                    InstrType,
                    AluControlD,
				IDEX_rs, IDEX_wba, IDEX_rt,
                    IDEX_A, IDEX_B, IDEX_SEimm, IDEX_2hr, IDEX_nextPC,IDEX_RegFile_cr,
                    IDEX_setInstr, IDEX_MemtoReg, IDEX_MemWrite, IDEX_MemAddrSrc,  IDEX_WBaddrSelect, IDEX_We3,
                    IDEX_InstrType,
                    IDEX_ALUcontrol);

// muxes

Mux4x1 ALUmux_A(EXMEM_AluOut, MEMWB_ALUOut, MEMWB_MemRd, IDEX_A, aluSrcA, mxALUSrcA_A_ALU);

Mux4x1 ALUFrwdmux_B (IDEX_B, MEMWB_MemRd, MEMWB_ALUOut, EXMEM_AluOut, aluSrcB, afterFrwdB );
Mux4x1 ALUsrcmux_B (afterFrwdB, IDEX_SEimm, IDEX_2hr, 32'd4, AluSrcBfrwdCtrl, mxALUSrcB_B_ALU);

//Execute, modules
alu ALU_M(mxALUSrcA_A_ALU, mxALUSrcB_B_ALU, IDEX_ALUcontrol,alu_ALUout);

Mux4x1 mxALUout(alu_ALUout, alu_ALUout , 32'd0, 32'd1 ,{alu_ALUout[31],IDEX_setInstr} ,mxALUout_AluOut_EXMEM);

forwarding EXEForwarding (IDEX_rs, IDEX_rt, EXMEM_wba, MEMWB_wba, IDEX_InstrType, 
     EXMEM_InstrType, MEMWB_InstrType, aluSrcA, aluSrcB, AluSrcBfrwdCtrl, memDwriteFrwdCtrl);




//MEM ----------------------------------------------------------------------------------------------
EX_MEM EXMEM_Reg(clk, 1'b0, 1'b1,
                    IDEX_wba,
                    IDEX_A, afterFrwdB, mxALUout_AluOut_EXMEM, IDEX_nextPC, IDEX_RegFile_cr,
                    IDEX_MemtoReg, IDEX_MemWrite, IDEX_MemAddrSrc, IDEX_WBaddrSelect, IDEX_We3,
                    IDEX_InstrType,
                    EXMEM_wba,
                    EXMEM_A, EXMEM_B, EXMEM_AluOut, EXMEM_nextPC, EXMEM_RegFile_cr, 
                    EXMEM_MemtoReg, memWrite, EXMEM_MemAddrSrc, EXMEM_WBaddrSelect, EXMEM_We3,
                    EXMEM_InstrType
                    );



//mem, muxes
Mux2x1 muxMEMmemAddr(EXMEM_A, EXMEM_AluOut, EXMEM_MemAddrSrc, memAddr);
Mux4x1 muxMEMmemData(EXMEM_B, EXMEM_RegFile_cr, MEMWB_ALUOut, MEMWB_MemRd, memDwriteFrwdCtrl, wrData);

//WB, modules

MEM_WB MWB_Reg(clk, 1'b0, 1'b1,
               EXMEM_wba,
                memData, EXMEM_AluOut, EXMEM_nextPC,
                    EXMEM_MemtoReg,  EXMEM_WBaddrSelect, EXMEM_We3,
                    EXMEM_InstrType,
                    
                    MEMWB_wba,
                    MEMWB_MemRd, MEMWB_ALUOut, MEMWB_nextPC, 
                    MEMWB_MemtoReg, MEMWB_WBaddrSelect, MWB_RegfileEn_We3,
                    MEMWB_InstrType
                    );

Mux2x1 mxWBD (MEMWB_ALUOut, MEMWB_MemRd, MEMWB_MemtoReg, mxWBD_out_mxWBDpc);

Mux2x1 mxWBDpc ( MEMWB_nextPC , mxWBD_out_mxWBDpc, MEMWB_WBaddrSelect ,mxWBD_writebackData_RegFile);




endmodule









