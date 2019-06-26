module stallUnit ( input logic clk, branchTaken,
    input logic [3:0] decInstrType, exInstrType, 
    input logic [4:0] decRS, decRT, exRegDest,
    output logic enPC, enIfId, rstIdEx,rstIfId
);

logic rsDependency, rtDependency;

//instruction in EXE stage is a load, the load operation writes to the RS register of the decode operation
assign rsDependency =  exInstrType == 4'd2 & exRegDest == decRS & decRS !=0  & decInstrType != 4'd4 & decInstrType != 4'd5 & (decInstrType < 4'd9 | decInstrType > 4'd11);

//instruction in EXE stage is a load, the load operation writes to the RT register of the decode operation, and the operation uses RT as a source operand
assign rtDependency =  exInstrType == 4'd2 & exRegDest == decRT & decInstrType != 4'd1 & (decInstrType < 4'd4 |  decInstrType > 4'd6) & (decInstrType < 4'd9 | decInstrType > 4'd11) & decRT != 0 ; 

// load interlock
// always_comb
always_ff @(posedge clk)
begin
if(rsDependency | rtDependency ) begin
    enPC <= 0; enIfId <= 0; rstIdEx <= 1; rstIfId<=0;
end
else begin
    if (branchTaken) begin
    enPC <= 1; enIfId <= 1; rstIdEx <= 0; rstIfId<=1;
    end
    else begin 
    enPC <= 1; enIfId <= 1; rstIdEx <= 0; rstIfId<=0;
    end
end
end

    

endmodule