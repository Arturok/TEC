module decfrd (
    input logic [3:0] decInstrType, exeInstrType, memInstrType,
    input logic [4:0] decRS, decRT, idex_wba, exmem_wba,
    output logic [1:0] compTopCtrl, compBotCtrl, addControl, multCtrl, FPadderCtrl, HRshiftCtrl,muxJnLctrl,
    output logic frwdJnLJR
);

logic execompBrTop, execompBrBottom, memcompBrTop, memcompBrBottom, frwdHRmem, frwdFPmem, frwdHRexe, frwdFPexe, frwdJnL, frwdJnLexe, frwdJnLmem;

//check if forward needed from EXE stage
frwd excheck(decInstrType, exeInstrType, decRS, decRT, idex_wba, execompBrTop, execompBrBottom);

//check if forward needed from MEM stage
frwd memcheck(decInstrType, memInstrType, decRS, decRT, exmem_wba, memcompBrTop, memcompBrBottom);


assign frwdHRmem = (memInstrType <= 4'd2 | memInstrType >= 4'd8) & (exmem_wba == 5'd4) & decInstrType >= 4'd8;
assign frwdHRexe = (exeInstrType <= 4'd2 | exeInstrType >= 4'd8) & (idex_wba == 5'd4 ) & decInstrType >= 4'd8;

assign frwdFPmem = (memInstrType <= 4'd2 | memInstrType >= 4'd8) & (exmem_wba == 5'd30) & decInstrType >= 4'd8;
assign frwdFPexe = (exeInstrType <= 4'd2 | exeInstrType >= 4'd8) & (idex_wba == 5'd30 ) & decInstrType >= 4'd8;

//if instruction in DECode is Jump Register and instruction in EXEcute writes back to jump register and is not a load
assign frwdJnLexe = (decInstrType == 4'd6 & idex_wba == decRS & (exeInstrType <= 4'd2 | exeInstrType >= 4'd8) );
assign frwdJnLmem = (decInstrType == 4'd6 & exmem_wba == decRS & (memInstrType <= 4'd2 | memInstrType >= 4'd8) );

//forward pc+4 when there is a jump register to 31, after a Jump and link
assign frwdJnLJR = (decInstrType == 4'd6 & decRS == 5'd31 & exeInstrType <= 4'd5 );

//there is no InstrType for Jump and Link of Jump Register

//Forward for Branch comparison source A
always_comb
//forward from EXE
if (decInstrType == 4'd7) begin
    //if theres is a need for forwad, instruction in decode is Branch and instruction in 
    if (execompBrTop & exeInstrType != 4'd2) compTopCtrl = 2'b01; //forward ALUout from ExeMem to ALU source A
    // forward from MEM
    else if (memcompBrTop) begin
        //if instruction is load
        if (memInstrType == 4'd2) compTopCtrl= 2'b11; //forward MemRd from MemWB to ALU source A
        else compTopCtrl= 2'b10; //forward ALUout from MemWB to ALU source A    
    end    
    else compTopCtrl = 2'b00; //no forward
end else compTopCtrl = 2'b00; //no forward

//Forward for Branch comparison source B
always_comb
//forward from EXE
if (decInstrType == 4'd7) begin
    if (execompBrBottom & exeInstrType != 4'd2 ) compBotCtrl = 2'b01; //forward ALUout from ExeMem to ALU source A
    // forward from MEM
    else if (memcompBrBottom) begin
        //if instruction is load
        if (memInstrType == 4'd2) compBotCtrl= 2'b11; //forward MemRd from MemWB to ALU source A
        else compBotCtrl= 2'b10; //forward ALUout from MemWB to ALU source A    
    end    
    else compBotCtrl = 2'b00; //no forward
end else compBotCtrl = 2'b00; //no forward





//Pixel move forwards
//Forward for RS adder
always_comb
//forward from EXE
if (decInstrType >= 4'd8) begin
    if (execompBrTop & exeInstrType != 4'd2 ) addControl = 2'b01; //forward ALUout from ExeMem to ALU source A
    // forward from MEM
    else if (memcompBrTop) begin
        //if instruction is load
        if (memInstrType == 4'd2) addControl= 2'b11; //forward MemRd from MemWB to ALU source A
        else addControl= 2'b10; //forward ALUout from MemWB to ALU source A    
    end    
    else addControl = 2'b00; //no forward
end else addControl = 2'b00; //no forward

//Forward for RT multiplier
always_comb
//forward from EXE
if (execompBrBottom & exeInstrType != 4'd2 ) multCtrl = 2'b01; //forward ALUout from ExeMem to ALU source A
// forward from MEM
else if (memcompBrBottom) begin
    //if instruction is load
    if (memInstrType == 4'd2) multCtrl= 2'b11; //forward MemRd from MemWB to ALU source A
    else multCtrl= 2'b10; //forward ALUout from MemWB to ALU source A    
end    
else multCtrl = 2'b00; //no forward


//Forward for FP adder
always_comb
//forward from EXE
if (frwdFPexe & exeInstrType != 4'd2) FPadderCtrl = 2'b01; //forward ALUout from ExeMem to ALU source A
// forward from MEM
else if (frwdFPmem) begin
    //if instruction is load
    if (memInstrType == 4'd2) FPadderCtrl= 2'b11; //forward MemRd from MemWB to ALU source A
    else FPadderCtrl= 2'b10; //forward ALUout from MemWB to ALU source A    
end    
else FPadderCtrl = 2'b00; //no forward


//Forward for HR shifter
always_comb
//forward from EXE
if (frwdHRexe & exeInstrType != 4'd2) HRshiftCtrl = 2'b01; //forward ALUout from ExeMem to ALU source A
// forward from MEM
else if (frwdHRmem) begin
    //if instruction is load
    if (memInstrType == 4'd2) HRshiftCtrl= 2'b11; //forward MemRd from MemWB to ALU source A
    else HRshiftCtrl= 2'b10; //forward ALUout from MemWB to ALU source A    
end    
else HRshiftCtrl = 2'b00; //no forward

//Forward for Jump n Link
//Forward for HR shifter
always_comb
//forward from EXE
if (frwdJnLexe & exeInstrType != 4'd2) muxJnLctrl = 2'b01; //forward ALUout from ExeMem to ALU source A
// forward from MEM
else if (frwdJnLmem) begin
    //if instruction is load
    if (memInstrType == 4'd2) muxJnLctrl= 2'b11; //forward MemRd from MemWB to ALU source A
    else muxJnLctrl= 2'b10; //forward ALUout from MemWB to ALU source A    
end    
else muxJnLctrl = 2'b00; //no forward

    
endmodule