module EX_MEM 	(input logic clk, reset, en,
					input logic [4:0]  d_wba, 
                    input logic [31:0] d_A, d_B, d_ALUresult, d_nextPC, d_color,
                    input logic d_MemtoReg, d_MemWrite, d_MemAddrSrc, d_WBaddrSelect, d_regWen,
                    input logic [3:0] d_InstrType, 
                    
					output logic [4:0]  q_wba, 
                    output logic [31:0] q_A, q_B, q_ALUresult, q_nextPC, q_color,
                    output logic q_MemtoReg, q_MemWrite, q_MemAddrSrc,  q_WBaddrSelect, q_regWen,
                    output logic [3:0] q_InstrType

                    );
					
                    
always_ff @(negedge clk)
	if (reset) begin      
        
        q_wba <= 'b0;         
        

        q_A <= 'b0;    
        q_B <= 'b0;
        q_ALUresult <= 'b0;
        q_nextPC <= 'b0;
        q_color <= 'b0;
        
        q_MemtoReg<= 0;
       
        q_MemWrite <= 0;
        q_MemAddrSrc <= 0; 
        q_InstrType <= 0;
        
        q_WBaddrSelect <= 0;
        q_regWen <=0;

        
        
        end
	else if (en) begin
        q_wba <= d_wba;         
      

        q_A <= d_A;    
        q_B <= d_B;
        q_ALUresult <= d_ALUresult;   
        q_nextPC <= d_nextPC; 
        q_color <= d_color;    
       
        q_MemtoReg <= d_MemtoReg;
        
        q_MemWrite <= d_MemWrite;
        q_MemAddrSrc <= d_MemAddrSrc;   
        q_InstrType <= d_InstrType; 
       
        q_WBaddrSelect <= d_WBaddrSelect;  
        q_regWen <= d_regWen;

    end
endmodule