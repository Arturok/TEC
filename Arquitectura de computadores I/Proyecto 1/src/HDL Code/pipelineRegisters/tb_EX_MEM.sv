module tb_EX_MEM ();
//inputs
	logic clk, reset, en;
	logic [4:0] d_rd, d_rt;
    logic [31:0] d_A, d_B, d_ALUresult;
    logic d_MemtoReg, d_RegSrc, d_MemWrite, d_MemAddrSrc;
    logic [2:0] d_InstrType;

//outputs
    logic [4:0]  q_rd, q_rt;
    logic [31:0] q_A, q_B, q_ALUresult;
    logic q_MemtoReg, q_RegSrc, q_MemWrite, q_MemAddrSrc;
    logic [2:0] q_InstrType;
    

logic [4:0] a = 5'd10;
	EX_MEM DUT(clk, reset, en,
					d_rd, d_rt,
                    d_A, d_B, d_ALUresult,
                    d_MemtoReg, d_RegSrc, d_MemWrite, d_MemAddrSrc, 
                    d_InstrType,
                    
					q_rd, q_rt,
                    q_A, q_B, q_ALUresult, 
                    q_MemtoReg, q_RegSrc, q_MemWrite, q_MemAddrSrc,
                    q_InstrType
                    );

	initial begin

         //initialize input values
        d_rd = 5'd2; d_rt = 5'd3;
        d_A = 32'd10;  d_B = 32'd5; d_ALUresult = 32'd30; 
        d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1;
        d_InstrType = 3'd1;
       

        clk = 1'd0; reset =1'd1; en = 1'd1; #10
        // start clock, enable, reset off
		reset =1'd0;
       
        // #10 //one clock cycle

        //regular operation
        assert(q_rd === 5'd2) else $error("normal_op: d_rd failed");
        assert(q_rt === 5'd3) else $error("normal_op: d_rt failed");

        assert(q_A === 32'd10) else $error("normal_op: q_A failed");
        assert(q_B === 32'd5) else $error("normal_op: q_B failed");
        assert(q_ALUresult === 32'd30) else $error("normal_op: q_ALUresult failed");
         
        assert(q_MemtoReg === 1) else $error("normal_op:  failed");
        assert(q_RegSrc === 1) else $error("normal_op: q_RegSrc failed");
        assert(q_MemWrite === 1) else $error("normal_op: q_MemWrite failed");
        assert(q_MemAddrSrc === 1) else $error("normal_op: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd1) else $error("normal_op: q_InstrType failed");


        #10 //another clock cycle

        d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd20;  d_B = 32'd25; d_ALUresult = 32'd230;  
        d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1;
        d_InstrType = 3'd2;
    
        //regular operation
        assert(q_rd === 5'd5) else $error("normal_op: d_rd failed");
        assert(q_rt === 5'd6) else $error("normal_op: d_rt failed");

        assert(q_A === 32'd20) else $error("normal_op: q_A failed");
        assert(q_B === 32'd25) else $error("normal_op: q_B failed");
        assert(q_ALUresult === 32'd230) else $error("normal_op: q_ALUresult failed");
        assert(q_InstrType === 3'd2) else $error("normal_op: q_InstrType failed");
        

        #10 //another clock cycle

        // enable off -----------------------------------------------------------------
		reset =1'd0; en = 1'd0; 
        //change values
        d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd15;  d_B = 32'd55; d_ALUresult = 32'd35;
        d_MemtoReg = 0; d_RegSrc = 0; d_MemWrite = 0; d_MemAddrSrc = 0;
        d_InstrType = 3'd3;
    
        

        // results should not be updated
        assert(q_rd === 5'd2) else $error("en_off: d_rd failed");
        assert(q_rt === 5'd3) else $error("en_off: d_rt failed");

        assert(q_A === 32'd10) else $error("en_off: q_A failed");
        assert(q_B === 32'd5) else $error("en_off: q_B failed");
        assert(q_ALUresult === 32'd30) else $error("en_off: q_ALUresult failed");
                
        
        assert(q_MemtoReg === 1) else $error("en_off: q_MemtoReg failed");
        assert(q_RegSrc === 1) else $error("en_off: q_RegSrc failed");
        assert(q_MemWrite === 1) else $error("en_off: q_MemWrite failed");
        assert(q_MemAddrSrc === 1) else $error("en_off: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd2) else $error("normal_op: q_InstrType failed");


        #10 //anther clock cycle

          // reset on -----------------------------------------------------------------
		 reset =1'd1; en = 1'd1; 
        //change values
        d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd15;  d_B = 32'd55; d_ALUresult = 32'd35;  
        d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1;
        d_InstrType = 3'd1;
        
        #10 //one clock cycle

        // results should be 0
        assert(q_rd === 5'd0) else $error("en_off: d_rd failed");
        assert(q_rt === 5'd0) else $error("en_off: d_rt failed");

        assert(q_A === 32'd0) else $error("en_off: q_A failed");
        assert(q_B === 32'd0) else $error("en_off: q_B failed");
        assert(q_ALUresult === 32'd0) else $error("en_off: q_ALUresult failed");

        
        assert(q_MemtoReg === 0) else $error("en_off: q_MemtoReg failed");
        assert(q_RegSrc === 0) else $error("en_off: q_RegSrc failed");
        assert(q_MemWrite === 0) else $error("en_off: q_MemWrite failed");
        assert(q_MemAddrSrc === 0) else $error("en_off: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd0) else $error("normal_op: q_InstrType failed");

	end

	always 
		#5 clk = ~clk;

endmodule