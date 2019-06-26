/*
Forwarding module
    selects the correct source for the ALU inputs, forwarding the results from the 
*/

module forwarding (
    input logic [4:0] idexRS, idexRT, exmem_wba, memwb_wba,
    input logic [3:0] idexInstrType, exmemInstrType, memwbInstrType,
    output logic [1:0] aluSrcA, aluSrcB, afterFrwdAluSrcB,
    output logic [1:0] memDwriteFrwdCtrl
);


logic wbForwardTop, wbForwardBottom, memForwardTop, memForwardBottom, memForwardCR;


//check if forward needed from Mem/Wb stage
frwd wbcheck(idexInstrType, memwbInstrType, idexRS, idexRT,memwb_wba, wbForwardTop, wbForwardBottom);

//check if forward needed from Ex/Mem stage
frwd memcheck(idexInstrType, exmemInstrType, idexRS, idexRT,exmem_wba, memForwardTop, memForwardBottom);

//set ALUsourceB for no forward depending on instruction type
nfrwd noforward(idexInstrType, afterFrwdAluSrcB);

//forward color register value to the memory write data
assign memForwardCR = ((memwb_wba == 5'd1 & (memwbInstrType <= 4'd2 | memwbInstrType >= 4'd8)) & ((exmemInstrType == 4'd3 & exmem_wba == 5'd1) | exmemInstrType >= 4'd10));

//Set mux control for ALU input A
always_comb
//forward from MEM
if (memForwardTop) aluSrcA = 2'b00; //forward ALUout from ExeMem to ALU source A
else if (wbForwardTop) begin
    //if instruction is load
    if (memwbInstrType == 4'd2) aluSrcA= 2'b10; //forward MemRd from MemWB to ALU source A
    else aluSrcA= 2'b01; //forward ALUout from MemWB to ALU source A    
end    
else aluSrcA = 2'b11; //no forward


//Set mux control for ALU input B
always_comb
//forward from MEM
if (memForwardBottom) aluSrcB = 2'b11; //forward ALUout from ExeMem to ALU source B
else if (wbForwardBottom) begin
    //if instruction is load
    if (memwbInstrType == 4'd2) aluSrcB= 2'b01; //forward MemRd from MemWB to ALU source B
    else aluSrcB= 2'b10; //forward ALUout from MemWB to ALU source B    
end    
else aluSrcB = 2'b00; //no forward


//Set mux control for the Data to write to memory
always_comb
//forward from MEM
if (memForwardCR) begin
    if (memwbInstrType == 4'd2) memDwriteFrwdCtrl = 2'd3; //forward MemRd from ExeMem to the memory write data
    else memDwriteFrwdCtrl = 2'd2; //forward ALUout from MemWB to the memory write data
end
else begin
    //if instruction is painting a pixel
    if (exmemInstrType >= 4'd10) memDwriteFrwdCtrl = 2'd1; //select CR
    else memDwriteFrwdCtrl = 2'd0; ; //select ALU output as memory write data   
end    




    


endmodule