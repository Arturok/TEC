module tb_stallUnit();
    


logic [2:0] decInstrType, exInstrType;
logic [4:0] decRS, decRT, exRegDest;
logic enPC, enIfId, rstIdEx;


stallUnit DUT (
    decInstrType, exInstrType, 
    decRS, decRT, exRegDest,
    enPC, enIfId, rstIdEx
);

initial begin

const logic [2:0] rrALU = 3'd0 , ALUimm = 3'd1, load = 3'd2, store = 3'd3, branch = 3'd4, ppMove = 3'd5, ppHmove = 3'd6, ppVmove = 3'd7;

//EXE instruction is a load
exInstrType = load;
//DEC instruction is Reg Reg ALU
decInstrType = rrALU;

decRS = 5'd1; decRT = 5'd1; exRegDest = 5'd1; #2



assert(enPC === 0) else $error("Load Interlock: PC should be disabled");
assert(enIfId === 0) else $error("Load Interlock IF/ID regiter should be disabled");
assert(rstIdEx === 1) else $error("Load Interlock: ID/EX should be reset");



decRS = 5'd1; decRT = 5'd2; exRegDest = 5'd1; #2



assert(enPC === 0) else $error("Load Interlock: PC should be disabled");
assert(enIfId === 0) else $error("Load Interlock IF/ID regiter should be disabled");
assert(rstIdEx === 1) else $error("Load Interlock: ID/EX should be reset");

decRS = 5'd2; decRT = 5'd1; exRegDest = 5'd1; #2



assert(enPC === 0) else $error("Load Interlock: PC should be disabled");
assert(enIfId === 0) else $error("Load Interlock IF/ID regiter should be disabled");
assert(rstIdEx === 1) else $error("Load Interlock: ID/EX should be reset");


// -------------------No interlocks--------------------

decRS = 5'd1; decRT = 5'd1; exRegDest = 5'd2; #2



assert(enPC === 1) else $error("Load Interlock: PC should be disabled");
assert(enIfId === 1) else $error("Load Interlock IF/ID regiter should be disabled");
assert(rstIdEx === 0) else $error("Load Interlock: ID/EX should be reset");


decInstrType = ALUimm;

decRS = 5'd2; decRT = 5'd1; exRegDest = 5'd1; #2



assert(enPC === 1) else $error("Load Interlock: PC should be disabled");
assert(enIfId === 1) else $error("Load Interlock IF/ID regiter should be disabled");
assert(rstIdEx === 0) else $error("Load Interlock: ID/EX should be reset");





end

endmodule