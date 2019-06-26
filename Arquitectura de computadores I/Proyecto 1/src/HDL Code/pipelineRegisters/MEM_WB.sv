module MEM_WB 	(input logic clk, reset, en,
					input logic [4:0]  d_wba,
                    input logic [31:0] d_MemRd, d_ALUresult, d_nextPC,
                    input logic d_MemtoReg,  d_WBaddrSelect, d_regWen,  
                    input logic [3:0] d_InstrType,
                    
					output logic [4:0]  q_wba,
                    output logic [31:0] q_MemRd, q_ALUresult, q_nextPC,
                    output logic q_MemtoReg,  q_WBaddrSelect, q_regWen,      
                    output logic [3:0] q_InstrType      
                    );
					
                    
always_ff @(negedge clk)
	if (reset) begin      
        
        q_wba <= 'b0;         
        

         
        q_MemRd <= 'b0;
        q_ALUresult <= 'b0;
        q_nextPC <= 'b0;
        
        q_MemtoReg<= 0;
        q_InstrType <= 0;
        q_WBaddrSelect <= 0;
        q_regWen <=0;
        
        end
	else if (en) begin
        q_wba <= d_wba;
        

        q_MemRd <= d_MemRd;
        q_ALUresult <= d_ALUresult; 
        q_nextPC <= d_nextPC;       
       
        q_MemtoReg <= d_MemtoReg;

        q_InstrType <= d_InstrType;
         q_WBaddrSelect <= d_WBaddrSelect;
        q_regWen <= d_regWen;


    end
endmodule