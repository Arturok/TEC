module frwd (
    input logic [3:0] exInstrType, aheadInstrType,
    input logic [4:0] exRS, exRT, RegDest,
    output logic forwardRS, forwardRT

);

logic intrWriteReg, intrUseRS, intrUseRT;
//instruction ahead is the type that writes back to register file
//all instructions but branch, jump and jump n link
assign intrWriteReg= (aheadInstrType <= 4'd2 | aheadInstrType >= 4'd8);

//instruction where data would be forwarded uses RS
//all but jump, jump and link, immediate move to pp and the paint and mves horizontal and vertical
assign intrUseRS =  (exInstrType != 4'd4 & exInstrType != 4'd5 & ( exInstrType < 4'd9 | exInstrType > 4'd11));

//instruction where data would be forwarded uses RT
assign intrUseRT = (exInstrType != 4'd1 & (exInstrType < 4'd4 |  exInstrType > 4'd6) & (exInstrType < 4'd9 | exInstrType > 4'd11 ));


    assign forwardRS = (intrWriteReg & intrUseRS & RegDest == exRS & exRS != 5'd0);
    assign forwardRT = (intrWriteReg & intrUseRT & RegDest == exRT & exRT != 5'd0);


endmodule