module tb_IF_ID ();
//inputs
	logic clk, reset, en;
	
    logic [31:0] d_nextPC, d_instruction;
    

//outputs
    
    logic [31:0] q_nextPC, q_instruction;
    

logic [4:0] a = 5'd10;

	IF_ID DUT       (clk, reset, en,					
                    d_nextPC, d_instruction,
                    q_nextPC, q_instruction);

	initial begin

         //initialize input values
        d_nextPC = 32'd4; 
        d_instruction = 32'd34;

        clk = 1'd1; reset =1'd1; en = 1'd1; #10
        // start clock, enable, reset off
		reset =1'd0;
       
        #10 //one clock cycle

        //regular operation
        assert(q_nextPC === 32'd4) else $error("normal_op: q_nextPC failed");
        assert(q_instruction === 32'd34) else $error("normal_op: q_instruction");


        #10 //anther clock cycle

        d_nextPC = 32'd8; 
        d_instruction = 32'd567;

        #10 //another clock cycle

        //regular operation
        assert(q_nextPC === 32'd8) else $error("normal_op: q_nextPC failed");
        assert(q_instruction === 32'd567) else $error("normal_op: q_instruction");

        #10 //another clock cycle

        // enable off -----------------------------------------------------------------
		d_nextPC = 32'd14; 
        d_instruction = 32'd923;
        en = 1'd0;

        #10 //another clock cycle

        // results should not be updated         
        assert(q_nextPC === 32'd8) else $error("normal_op: q_nextPC failed");
        assert(q_instruction === 32'd567) else $error("normal_op: q_instruction");


        #10 //another clock cycle

          // reset on -----------------------------------------------------------------
        en = 1'd1;
		 reset =1'd1; en = 1'd1; 

        #10 //another clock cycle
        // results should be 0         
         assert(q_nextPC === 32'd0) else $error("normal_op: q_nextPC failed");
        assert(q_instruction === 32'd0) else $error("normal_op: q_instruction");
	end

	always 
		#5 clk = ~clk;

endmodule