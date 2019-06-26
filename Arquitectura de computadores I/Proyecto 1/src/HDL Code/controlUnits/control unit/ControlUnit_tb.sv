module ControlUnit_tb (); 


	logic [5:0] OpCode, Funct;
	logic [1:0] PCSrcD;
	logic [3:0] InstrType, AluControlD;
	logic Comp, ShamtMuxCtrl, BranchTaken, SetInstr, MemtoRegD,
	RegSrcD, MemWriteD, MemAddSrcD, BSrcD, ASrcD, MultSrcD, SumSrcBD,
	SumSrcAD, MemRegwbAddr, WeWB;

	ControlUnit ctrl(Comp, OpCode, Funct, PCSrcD, InstrType,
	AluControlD, ShamtMuxCtrl, BranchTaken, SetInstr, MemtoRegD,
	RegSrcD, MemWriteD, MemAddSrcD, BSrcD, ASrcD, MultSrcD, SumSrcBD,
	SumSrcAD, MemRegwbAddr, WeWB);

	initial begin

//####################Opcode=0; Funct=!0#####################################

		/*
		Comprobar funciona la salida correspondientes
		la instruccion add 
		*/
		OpCode = 6'd0; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 & 
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd0 & 
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 & 
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion add");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion and
		*/
		OpCode = 6'd0; Funct = 6'd2; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd2 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion and");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion nor 
		*/
		OpCode = 6'd0; Funct = 6'd3; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd4 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion nor");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion or 
		*/
		OpCode = 6'd0; Funct = 6'd4; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd3 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion or");


	

		//Comprobar funciona la salida correspondientes la instruccion slt
		
		OpCode = 6'd0; Funct = 6'd5; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 1 & 
		    MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd1 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion slt");


		/*
		Comprobar funciona la sali correspondientes
		la instruccion sll
		*/
		OpCode = 6'd0; Funct = 6'd6; Comp = 0; #10;
		assert(ShamtMuxCtrl == 1 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd1 & MemAddSrcD == 0 & AluControlD == 4'd6 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion sll");


		/*
		Comprobar funciona la sali correspondientes
		la instruccion slr
		*/
		OpCode = 6'd0; Funct = 6'd7; Comp = 0; #10;
		assert(ShamtMuxCtrl == 1 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd1 & MemAddSrcD == 0 & AluControlD == 4'd7 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion slr");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion sub 
		*/
		OpCode = 6'd0; Funct = 6'd8; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd1 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion sub");


		/*
		Comprobar funciona la salida default
		*/
		OpCode = 6'd0; Funct = 6'd20; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida default");

//###########################################################################

//#########################Opcode != 0; Funct = X############################

		/*
		Comprobar funciona la salida correspondientes
		la instruccion addi
		*/
		OpCode = 6'd1; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd1 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion addi");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion beq
		*/

		//Con el comp = 0 no debería tomarse el branch

		OpCode = 6'd3; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd7 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion no tomado");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion beq
		*/
		OpCode = 6'd3; Funct = 6'd0; Comp = 1; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 1 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd7 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd1 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion beq");




		/*
		Comprobar funciona la salida correspondientes
		la instruccion bne
		*/

		//Con el comp = 1 no debería tomarse el branch

		OpCode = 6'd4; Funct = 6'd0; Comp = 1; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd7 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion bne no tomado");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion bne
		*/
		OpCode = 6'd4; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 1 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd7 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd1 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion bne tomado");



		/*
		Comprobar funciona la salida correspondientes
		la instruccion j
		*/
		OpCode = 6'd5; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 1 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd4 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd2 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion j");



		/*
		Comprobar funciona la salida correspondientes
		la instruccion jal
		*/
		OpCode = 6'd6; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 1 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd5 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd2 & WeWB == 1 & MemRegwbAddr == 0) else
			 $error("Error al cargar la salida para la instruccion jal");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion lw
		*/
		OpCode = 6'd7; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 1 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd2 & MemAddSrcD == 1 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion lw");


		//Comprobar funciona la salida correspondientes la instruccion slti
		
		OpCode = 6'd9; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 1 & 
		    MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd1 & MemAddSrcD == 0 & AluControlD == 4'd1 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion slti");
		
		/*
		Comprobar funciona la salida correspondientes
		la instruccion sw
		*/
		OpCode = 6'd10; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 1 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd3 & MemAddSrcD == 1 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion sw");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion mpp
		*/
		OpCode = 6'd12; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd8 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 1 & ASrcD == 1 & MultSrcD == 0 & SumSrcBD == 1 &
			SumSrcAD == 1 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion mpp");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion mppi
		*/
		OpCode = 6'd13; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd9 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 1 & ASrcD == 1 & MultSrcD == 1 & SumSrcBD == 0 &
			SumSrcAD == 1 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion mppi");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion ppxl
		*/
		OpCode = 6'd14; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd3 & MemAddSrcD == 1 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ppxl");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion ptmu
		*/
		OpCode = 6'd15; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd11 & MemAddSrcD == 0 & AluControlD == 4'd1 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ptmu");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion ptml
		*/
		OpCode = 6'd16; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd10 & MemAddSrcD == 0 & AluControlD == 4'd1 &
			BSrcD == 0 & ASrcD == 1 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ptml");

		/*
		Comprobar funciona la salida correspondientes
		la instruccion ptmd
		*/
		OpCode = 6'd17; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd11 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ptmd");



		/*
		Comprobar funciona la salida correspondientes
		la instruccion ptmr
		*/
		OpCode = 6'd18; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd10 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ptmr");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion ppxlc
		*/
		OpCode = 6'd19; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 1 &
			InstrType == 4'd12 & MemAddSrcD == 1 & AluControlD == 4'd0 &
			BSrcD == 1 & ASrcD == 1 & MultSrcD == 0 & SumSrcBD == 1 &
			SumSrcAD == 1 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion ppxlc");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion pmpxl
		*/
		OpCode = 6'd20; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 1 &
			InstrType == 4'd12 & MemAddSrcD == 1 & AluControlD == 4'd0 &
			BSrcD == 1 & ASrcD == 1 & MultSrcD == 0 & SumSrcBD == 1 &
			SumSrcAD == 1 & PCSrcD == 2'd3 & WeWB == 1 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion pmpxl");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion jr
		*/
		OpCode = 6'd24; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 1 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 1 & MemWriteD == 0 &
			InstrType == 4'd6 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd0 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida para la instruccion jr");


//Salida default

		OpCode = 6'd27; Funct = 6'd0; Comp = 0; #10;
		assert(ShamtMuxCtrl == 0 & BranchTaken == 0 & SetInstr == 0 & 
			MemtoRegD == 0 & RegSrcD == 0 & MemWriteD == 0 &
			InstrType == 4'd0 & MemAddSrcD == 0 & AluControlD == 4'd0 &
			BSrcD == 0 & ASrcD == 0 & MultSrcD == 0 & SumSrcBD == 0 &
			SumSrcAD == 0 & PCSrcD == 2'd3 & WeWB == 0 & MemRegwbAddr == 1) else
			 $error("Error al cargar la salida default");

	end

endmodule