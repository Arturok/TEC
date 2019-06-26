module ID_EX 	(input logic clk, reset, en,
					input logic [4:0] d_rs, d_wba, d_rt,
                    input logic [31:0] d_A, d_B, d_SEimm, d_2hr, d_nextPC, d_color,
                    input logic d_setInstr, d_MemtoReg, d_MemWrite, d_MemAddrSrc, d_WBaddrSelect, d_regWen, 
                    input logic [3:0] d_InstrType,
                    input logic [3:0] d_ALUcontrol,
                    
					output logic [4:0] q_rs, q_wba, q_rt,
                    output logic [31:0] q_A, q_B, q_SEimm, q_2hr, q_nextPC, q_color,
                    output logic q_setInstr, q_MemtoReg, q_MemWrite, q_MemAddrSrc,  q_WBaddrSelect, q_regWen,
                    output logic [3:0] q_InstrType,
                    output logic [3:0] q_ALUcontrol
                    );
					
                    
always_ff @(negedge clk)
	if (reset) begin      
        q_rs <= 'b0;
        q_wba <= 'b0;         
        q_rt <= 'b0;
    

        q_A <= 'b0;    
        q_B <= 'b0;
        q_SEimm <= 'b0;
        q_2hr <= 'b0;
        q_nextPC <= 'b0;
        q_color <= 'b0;

        
        q_setInstr<= 0; 
        q_MemtoReg<= 0;
       
        q_MemWrite <= 0;
        q_MemAddrSrc <= 0;
        q_InstrType <= 0;
       
        q_WBaddrSelect <= 0;
        q_regWen <= 0;
        
        q_ALUcontrol <= 'b0;      
        
        end
	else if (en) begin
        q_rs <= d_rs;
        q_wba <= d_wba;         
        q_rt <= d_rt;

        q_A <= d_A;    
        q_B <= d_B;
        q_SEimm <= d_SEimm;
        q_2hr <= d_2hr ;
        q_nextPC <= d_nextPC;
        q_color <= d_color;
        
        q_setInstr <= d_setInstr; 
        q_MemtoReg <= d_MemtoReg;
      
        q_MemWrite <= d_MemWrite;
        q_MemAddrSrc <= d_MemAddrSrc;
        q_InstrType <= d_InstrType;
        
        q_WBaddrSelect <= d_WBaddrSelect;
        q_regWen <= d_regWen;
        

        q_ALUcontrol <= d_ALUcontrol;

    end
endmodule