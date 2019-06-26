module tb_decfrd ();
//inputs
logic [4:0] idexRS='b0, idexRT='b0, exmem_wba='b0, memwb_wba='b0;
logic [2:0] decInstrType ='b0, exInstrType='b0, memInstrType='b0;
    
    

//outputs
    
logic [1:0] compTopCtrl, compBotCtrl, addControl, multCtrl;

    



	decfrd DUT (decInstrType, exInstrType, memInstrType,
                idexRS, idexRT, exmem_wba, memwb_wba,                    
                    compTopCtrl, compBotCtrl, addControl, multCtrl);
    
	initial begin

const logic [1:0] nofrw = 2'd0 ,frwALUexe = 2'd1, frwALUmem = 2'd2, frwMemRdmem = 2'd3; 
const logic [2:0] rrALU = 3'd0 , ALUimm = 3'd1, load = 3'd2, store = 3'd3, branch = 3'd4, ppMove = 3'd5, ppHmove = 3'd6, ppVmove = 3'd7;


    //############# Forward from MEM stage #################
    //----------MEM instr is Reg Reg ALU----------
        //instruction in WB and EXE stage are Reg Reg ALU 
        memInstrType = 3'd0; 
        decInstrType =  3'd0;

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        memwb_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        //since both operations are Reg Reg ALU they should be forwarded ahead
        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");


// ================BRANCH=============================
       

        decInstrType =  3'd4; #2 //instruction in DECode is a Branch instruction

        //Both ALU results should be forwarded
        assert(compTopCtrl === frwALUmem) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwALUmem) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        
		
        //----------MEM instr is ALUimm----------

        //instruction in WB stage is ALUimm and EXE is Reg Reg ALU 
        memInstrType = 3'd1; 
        

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs
        //both results should be forwarded
        memwb_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        assert(compTopCtrl === frwALUmem) else $error("ALUimm: both forward: compTopCtrl failed");
        assert(compBotCtrl === frwALUmem) else $error("ALUimm: both forward: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
       
        //forward RS only
        idexRT = 5'd2;#2
        assert(compTopCtrl === frwALUmem) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
        
        // forward RT only
        idexRT = 5'd1; idexRS = 5'd2; #2
        assert(compTopCtrl === nofrw) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwALUmem) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //----------MEM instr is Load----------

       //instruction in MEM is a load
        memInstrType = 3'd2;

        idexRT = 5'd1; idexRS = 5'd1; #2
        //Both ALU result should be forwarded
        assert(compTopCtrl === frwMemRdmem) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwMemRdmem) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
       
        //forward RS only
        idexRT = 5'd2;#2
        assert(compTopCtrl === frwMemRdmem) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
        
        // forward RT only
        idexRT = 5'd1; idexRS = 5'd2; #2
        assert(compTopCtrl === nofrw) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwMemRdmem) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");



// //======================================================================================================

//         //############# Forward from EXE stage #################
        memwb_wba = 'b0; //change value of WB destination register so there is only forward from MEM

        //----------EXE instr is Reg Reg ALU----------
        //instruction in  EXE stage is Reg Reg ALU 
        exInstrType = 3'd0; 
        decInstrType =  3'd4; //instruction in decode is a Branch

        //destination register is going to be used in the next executing
        //instruction as the top and bottom ALU inputs        
        exmem_wba = 5'd1; idexRS = 5'd1; idexRT = 5'd1;  #2

        // ALUresult should be forwarded to both compare inputs
        assert(compTopCtrl === frwALUexe) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwALUexe) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //forward RS only
        idexRT = 5'd2;#2
        assert(compTopCtrl === frwALUexe) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
        
        // forward RT only
        idexRT = 5'd1; idexRS = 5'd2; #2
        assert(compTopCtrl === nofrw) else $error("ALUimm: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwALUexe) else $error("ALUimm: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        
        //----------EXE instr is Load----------

       //instruction in EXE is a load
        exInstrType = 3'd2;

        idexRT = 5'd1; idexRS = 5'd1; #2

        //There shouldn;t be a forward fr a LOAD instruction from EXE
        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
       
 

    //======================================================================================================

        //############# Both Forward #################
        //when there is a forward from both the MEM and EXE stages, the forward from EXE should take priority
        exmem_wba = 5'd1; memwb_wba=5'd1; idexRS = 5'd1; idexRT = 5'd1;

        //Instructions are Reg Reg ALU which require forward
        exInstrType = 3'd0;  memInstrType = 3'd0;        
        //decoded instruction is a branch
        decInstrType =  3'd4;
        #2

        assert(compTopCtrl === frwALUexe) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === frwALUexe) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
          


//         //MEM instruction is LOAD which require forward, MEM instruction is ALU
        memInstrType = 3'd2; exInstrType = 3'd0;  
        exmem_wba = 5'd1; memwb_wba=5'd2; idexRS = 5'd1; idexRT = 5'd2;

        #2
        //forward on input A from MEM and input B from EXE
        assert(compTopCtrl === frwALUexe) else $error("WB and MEM forward: compTopCtrl failed");
        assert(compBotCtrl === frwMemRdmem) else $error("WB and MEM forward: compBotCtrl failed");

        //MEM instruction is LOAD which require forward, MEM instruction is ALU
        memInstrType = 3'd2; exInstrType = 3'd0;  
        exmem_wba = 5'd1; memwb_wba=5'd2; idexRS = 5'd2; idexRT = 5'd1;

        #2
        //forward on input A from MEM and input B from EXE
        assert(compTopCtrl === frwMemRdmem) else $error("WB and MEM forward: compTopCtrl failed");
        assert(compBotCtrl === frwALUexe) else $error("WB and MEM forward: compBotCtrl failed");



//  //====================================PP Moves==================================================================

        //decoded instruction is a PPmove
        decInstrType =  ppMove;
//         //############# Forward from EXE #################

        exmem_wba = 5'd1; memwb_wba=5'd0; idexRS = 5'd1; idexRT = 5'd1;

        //Instructions ain EXE is Register Register ALU
        exInstrType = rrALU;#2

        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUexe) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
    //only top
    idexRT = 5'd2;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUexe) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //only bottom
    idexRS = 5'd2; idexRT = 5'd1;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");


//         //############# Forward from MEM #################

exmem_wba = 5'd0; memwb_wba=5'd1; idexRS = 5'd1; idexRT = 5'd1;

        //Instructions in EXE is Register Register ALU
        memInstrType = rrALU;#2

        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
    //only top
    idexRT = 5'd2;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //only bottom
    idexRS = 5'd2; idexRT = 5'd1;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");


        //-------------------------------------------------------------

        //Instruction in EXE is load
        memInstrType = load;
        
        idexRS = 5'd1; idexRT = 5'd1;#2

        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
    //only top
    idexRT = 5'd2;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //only bottom
    idexRS = 5'd2; idexRT = 5'd1;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //-------------------------------------------------------------

        //Instruction in EXE is ppmove
        memInstrType = ppMove;
        
        idexRS = 5'd1; idexRT = 5'd1;#2

        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
    //only top
    idexRT = 5'd2;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === nofrw) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

        //only bottom
    idexRS = 5'd2; idexRT = 5'd1;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === nofrw) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

//         //############# Both Forwards #################



        //Instructions in EXE is Register Register ALU
        memInstrType = rrALU; exInstrType = rrALU; #2
        //RS from EXE and RT from MEM
        exmem_wba = 5'd1; memwb_wba=5'd2; idexRS = 5'd1; idexRT = 5'd2;#2

        assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUexe) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUmem) else $error("Reg Reg ALU: both forward: compBotCtrl failed");
          
    ////RS from MEM and RT from EXE
    exmem_wba = 5'd1; memwb_wba=5'd2;idexRT = 5'd1;idexRS = 5'd2;#2

    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");

         ////both the same EXE should be forwarded
    exmem_wba = 5'd1; memwb_wba=5'd1;idexRT = 5'd1;idexRS = 5'd1;#2

    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwALUexe) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");


             ////instruction in MEM is a load

             memInstrType = load;

    exmem_wba = 5'd1; memwb_wba=5'd2;idexRT = 5'd1;idexRS = 5'd2;#2

    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");


    //-------------------------------------------------------------

        //Instruction in EXE is ppmove
        exInstrType = ppMove;
    exmem_wba = 5'd1; memwb_wba=5'd2; idexRS = 5'd2; idexRT = 5'd1;#2
    assert(compTopCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd: compTopCtrl failed");
        assert(compBotCtrl === nofrw) else $error("Reg Reg ALU: Only top frwd_bottom instr ALUimm: compBotCtrl failed");
        assert(addControl === frwMemRdmem) else $error("Reg Reg ALU: both forward: compTopCtrl failed");
        assert(multCtrl === frwALUexe) else $error("Reg Reg ALU: both forward: compBotCtrl failed");




//  //======================================================================================================

//         //############# No Forward #################
//         //Should select right B input according to instruction type
//         // A input source is always ID/EX A value

//         //All registers are different (no forwarding)
//         exmem_wba = 5'd1; exmem_wba = 5'd2; memwb_wba=5'd3; idexRS = 5'd4; idexRT = 5'd6;

//         //All instructions are Reg Reg ALU which require forward but registers are different, so no forward should take place
//         exInstrType = 3'd0; decInstrType =  3'd0; memInstrType = 3'd0;        
//         #2


//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd0) else $error("No forward: All Reg Reg: compBotCtrl failed");


//         //Executing instruction is ALUimmediate B alu 
//         decInstrType =  3'd1;         
//         #2
//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd1) else $error("No forward: All Reg Reg: compBotCtrl failed");

//         //Executing instruction is LOAD
//         decInstrType =  3'd2;         
//         #2
//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd1) else $error("No forward: All Reg Reg: compBotCtrl failed");

//         //Executing instruction is store 
//         decInstrType =  3'd3;         
//         #2
//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd1) else $error("No forward: All Reg Reg: compBotCtrl failed");

//         //Executing instruction horizontal move of pp
//         decInstrType =  3'd6;         
//         #2
//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd6) else $error("No forward: All Reg Reg: compBotCtrl failed");

//         //Executing instruction vertical move of pp
//         decInstrType =  3'd7;         
//         #2
//         assert(compTopCtrl === 2'd3) else $error("No forward: All Reg Reg: compTopCtrl failed");
//         assert(compBotCtrl === 3'd5) else $error("No forward: All Reg Reg: compBotCtrl failed");

//         // #2 //one clock cycle

//         // //regular operation
//         // assert(q_nextPC === 32'd4) else $error("normal_op: q_nextPC failed");
//         // assert(q_instruction === 32'd34) else $error("normal_op: q_instruction");


//         // #2 //anther clock cycle

       
//         // #2 //another clock cycle

      
	end

	

endmodule