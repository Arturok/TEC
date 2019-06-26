module tb_forwarding ();
//inputs
logic [4:0] idexRS='b0, idexRT='b0, exmem_wba='b0, memwb_wba='b0;
logic [2:0] idexInstrType='b0, exmemInstrType='b0, memwbInstrType='b0;
    
    

//outputs
    
logic [1:0] aluSrcA;
logic [2:0] aluSrcB;
    



	forwarding DUT (idexRS, idexRT, exmem_wba, memwb_wba,
                    idexInstrType, exmemInstrType, memwbInstrType,
                    aluSrcA, aluSrcB);
    
	initial begin


    //############# Forward from WB stage #################
    //----------WB instr is Reg Reg ALU----------
        //instruction in WB and EXE stage are Reg Reg ALU 
        memwbInstrType = 4'd0; 
        idexInstrType =  4'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        //both results should be forwarded
        memwb_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        assert(aluSrcA === 2'd1) else $error("Reg Reg ALU: both forward: AluSrcA failed");
        assert(aluSrcB === 3'd3) else $error("Reg Reg ALU: both forward: AluSrcB failed");
       
       //destination register is going to be used in the next executing
        //instruction as the top ALU input
        //Only A should be forwarded
        idexInstrType =  4'd1; #2 //instruction in EXE is ALUimm

        assert(aluSrcA === 2'd1) else $error("Reg Reg ALU: Only top frwd: AluSrcA failed");
        assert(aluSrcB === 3'd1) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: AluSrcB failed");

		
        //----------WB instr is ALUimm----------

        //instruction in WB stage is ALUimm and EXE is Reg Reg ALU 
        memwbInstrType = 4'd1; 
        idexInstrType =  4'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        //both results should be forwarded
        memwb_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        assert(aluSrcA === 2'd1) else $error("ALUimm: both forward: AluSrcA failed");
        assert(aluSrcB === 3'd3) else $error("ALUimm: both forward: AluSrcB failed");
       
        //destination register is going to be used in the next executing
        //instruction as the top ALU input
        //Only A should be forwarded
        idexInstrType =  4'd1; #2 //instruction in EXE is ALUimm

        assert(aluSrcA === 2'd1) else $error("ALUimm: Only top frwd: AluSrcA failed");
        assert(aluSrcB === 3'd1) else $error("ALUimm: Only top frwd_bottom instr ALUimm: AluSrcB failed");

        //----------WB instr is Load----------

        //instruction in WB stage is Load and EXE is Reg Reg ALU 
        memwbInstrType = 4'd2; 
        idexInstrType =  4'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        //both results should be forwarded
        memwb_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        assert(aluSrcA === 2'd2) else $error("LOAD: both forward: AluSrcA failed");
        assert(aluSrcB === 3'd2) else $error("LOAD: both forward: AluSrcB failed");
       
        //destination register is going to be used in the next executing
        //instruction as the top ALU input
        
        idexInstrType =  4'd1; #2 //instruction in EXE is ALUimm
        //Only A should be forwarded
        assert(aluSrcA === 2'd2) else $error("LOAD: Only top frwd: AluSrcA failed");
        assert(aluSrcB === 3'd1) else $error("LOAD: Only top frwd_bottom instr ALUimm: AluSrcB failed");


//======================================================================================================

        //############# Forward from MEM stage #################
        memwb_wba = 'b0; //change value of WB destination register so there is only forward from MEM

        //----------MEM instr is Reg Reg ALU----------
        //instruction in MEM and EXE stage are Reg Reg ALU 
        exmemInstrType = 4'd0; 
        idexInstrType =  4'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs        
        exmem_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        //EX/MEM. ALUresult should be forwarded to both ALU inputs
        assert(aluSrcA === 2'd0) else $error("Reg Reg ALU: both forward: AluSrcA failed");
        assert(aluSrcB === 4'd4) else $error("Reg Reg ALU: both forward: AluSrcB failed");
       
       //destination register is going to be used in the next executing
        //instruction as the top ALU input
        //Only A should be forwarded
        idexInstrType =  4'd1; #2 //instruction in EXE is ALUimm

        assert(aluSrcA === 2'd0) else $error("Reg Reg ALU: Only top frwd: AluSrcA failed");
        assert(aluSrcB === 4'd1) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: AluSrcB failed");

        //----------MEM instr is ALU imm----------

        //instruction in MEM stage is ALUimm and EXE is Reg Reg ALU 
        exmemInstrType = 4'd1; 
        idexInstrType =  4'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        //both results should be forwarded
        exmem_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        assert(aluSrcA === 2'd0) else $error("ALUimm: both forward: AluSrcA failed");
        assert(aluSrcB === 4'd4) else $error("ALUimm: both forward: AluSrcB failed");
       
        //destination register is going to be used in the next executing
        //instruction as the top ALU input
        //Only A should be forwarded
        idexInstrType =  4'd1; #2 //instruction in EXE is ALUimm

        assert(aluSrcA === 2'd0) else $error("ALUimm: Only top frwd: AluSrcA failed");
        assert(aluSrcB === 4'd1) else $error("ALUimm: Only top frwd_bottom instr ALUimm: AluSrcB failed");


    //======================================================================================================

        //############# Both Forward #################
        //when there is a forward from both the MEM and WB stage, the forward from MEM should take priority
        exmem_wba = 5'd1; memwb_wba=5'd1; idexRS = 5'd1; idexRT = 5'd1;

        //All instructions are Reg Reg ALU which require forward
        exmemInstrType = 4'd0; idexInstrType =  4'd0; memwbInstrType = 4'd0;        
        #2

        assert(aluSrcA === 2'd0) else $error("WB and MEM forward: AluSrcA failed");
        assert(aluSrcB === 4'd4) else $error("WB and MEM forward: AluSrcB failed");
          
          
        //WB instruction is LOAD which require forward
        memwbInstrType = 4'd2;        
        #2
        //EXE MemRd value should be forwarded to both ALU inputs
        assert(aluSrcA === 2'd0) else $error("WB and MEM forward: AluSrcA failed");
        assert(aluSrcB === 4'd4) else $error("WB and MEM forward: AluSrcB failed");

        //WB instruction is LOAD which require forward, MEM instruction is ALU
        memwbInstrType = 4'd2; exmemInstrType = 4'd0; idexInstrType =  4'd0;  
        exmem_wba = 5'd1; memwb_wba=5'd2; idexRS = 5'd1; idexRT = 5'd2;

        #2
        //forward on input A from EXE and input B from WB
        assert(aluSrcA === 2'd0) else $error("WB and MEM forward: AluSrcA failed");
        assert(aluSrcB === 4'd2) else $error("WB and MEM forward: AluSrcB failed");


 //======================================================================================================

        //############# No Forward #################
        //Should select right B input according to instruction type
        // A input source is always ID/EX A value

        //All registers are different (no forwarding)
        exmem_wba = 5'd1; exmem_wba = 5'd2; memwb_wba=5'd3; idexRS = 5'd4; idexRT = 5'd6;

        //All instructions are Reg Reg ALU which require forward but registers are different, so no forward should take place
        exmemInstrType = 4'd0; idexInstrType =  4'd0; memwbInstrType = 4'd0;        
        #2


        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd0) else $error("No forward: All Reg Reg: AluSrcB failed");


        //Executing instruction is ALUimmediate B alu 
        idexInstrType =  4'd1;         
        #2
        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd1) else $error("No forward: All Reg Reg: AluSrcB failed");

        //Executing instruction is LOAD
        idexInstrType =  4'd2;         
        #2
        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd1) else $error("No forward: All Reg Reg: AluSrcB failed");

        //Executing instruction is store 
        idexInstrType =  4'd3;         
        #2
        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd1) else $error("No forward: All Reg Reg: AluSrcB failed");

        //Executing instruction horizontal move of pp
        idexInstrType =  4'd6;         
        #2
        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd6) else $error("No forward: All Reg Reg: AluSrcB failed");

        //Executing instruction vertical move of pp
        idexInstrType =  4'd7;         
        #2
        assert(aluSrcA === 2'd3) else $error("No forward: All Reg Reg: AluSrcA failed");
        assert(aluSrcB === 4'd5) else $error("No forward: All Reg Reg: AluSrcB failed");

        // #2 //one clock cycle

        // //regular operation
        // assert(q_nextPC === 32'd4) else $error("normal_op: q_nextPC failed");
        // assert(q_instruction === 32'd34) else $error("normal_op: q_instruction");


        // #2 //anther clock cycle

       
        // #2 //another clock cycle

      
	end

	

endmodule