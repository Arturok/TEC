module nfrwd (
    input logic [3:0] idexInstrType,
    output logic [1:0] afterFrwdAluSrcB
);
    
    //set ALUsourceB for no forward depending on instruction type
always_comb
case(idexInstrType)
    4'd1: //ALU Imm
        afterFrwdAluSrcB = 2'b01; //select SEimm

    4'd2:// Load
        afterFrwdAluSrcB = 2'b01; //select SEimm
    4'd3://Store
        afterFrwdAluSrcB = 2'b01; //select SEimm
    4'd10://horizontal move of pp
        afterFrwdAluSrcB = 2'b10; //select 4 input
    4'd11://vertical move of pp
        afterFrwdAluSrcB = 2'b11; //select hr<<2 input

    default: //All other instruction types
        afterFrwdAluSrcB = 2'b00; //select B output from ID/EX register

endcase
endmodule