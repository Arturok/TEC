module IF_ID 	(   input logic clk, reset, en,
                    input logic [31:0] d_nextPC, d_instruction,
                    output logic [31:0] q_nextPC, q_instruction
                    );
					
                    
always_ff @(negedge clk)
	if (reset) begin      
        q_nextPC<= 'b0;
        q_instruction <= 'b0;
        end
	else if (en) begin
        q_nextPC<= d_nextPC;
        q_instruction <= d_instruction;

    end
endmodule