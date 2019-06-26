module tb_ID_EX ();
//inputs
	logic clk, reset, en;
	logic [4:0] d_rs, d_rd, d_rt;
    logic [31:0] d_A, d_B, d_SEimm, d_2hr;
    logic d_Stall, d_MemtoReg, d_RegSrc, d_MemWrite, d_MemAddrSrc;
    logic [2:0] d_InstrType;
    logic [3:0] d_ALUcontrol;

//outputs
    logic [4:0] q_rs, q_rd, q_rt;
    logic [31:0] q_A, q_B, q_SEimm, q_2hr;
    logic q_Stall, q_MemtoReg, q_RegSrc, q_MemWrite, q_MemAddrSrc;
    logic [2:0] q_InstrType;
    logic [3:0] q_ALUcontrol;

logic [4:0] a = 5'd10;

	ID_EX DUT(clk, reset, en,
					d_rs, d_rd, d_rt,
                    d_A, d_B, d_SEimm, d_2hr,
                    d_Stall, d_MemtoReg, d_RegSrc, d_MemWrite, d_MemAddrSrc,
                    d_InstrType,
                    d_ALUcontrol,
					q_rs, q_rd, q_rt,
                    q_A, q_B, q_SEimm, q_2hr,
                    q_Stall, q_MemtoReg, q_RegSrc, q_MemWrite, q_MemAddrSrc,
                    q_InstrType,
                    q_ALUcontrol);

	initial begin

         //initialize input values
        d_rs = 5'd1; d_rd = 5'd2; d_rt = 5'd3;
        d_A = 32'd10;  d_B = 32'd5; d_SEimm = 32'd30; d_2hr= 32'd45; 
        d_Stall = 1; d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1; 
        d_InstrType = 3'd1;
        d_ALUcontrol = 4'd2;

        // start clock, enable, reset
        clk = 1'd0; reset =1'd1; en = 1'd1; #10
        // reset off
		reset =1'd0;
       
        // #10 //one clock cycle

        //regular operation
		assert(q_rs === 5'd1) else $error("normal_op: d_rs failed");
        assert(q_rd === 5'd2) else $error("normal_op: d_rd failed");
        assert(q_rt === 5'd3) else $error("normal_op: d_rt failed");

        assert(q_A === 32'd10) else $error("normal_op: q_A failed");
        assert(q_B === 32'd5) else $error("normal_op: q_B failed");
        assert(q_SEimm === 32'd30) else $error("normal_op: q_SEimm failed");
        assert(q_2hr === 32'd45) else $error("normal_op: q_2hr failed");

        
        assert(q_Stall === 1) else $error("normal_op: q_Stall failed");
        assert(q_MemtoReg === 1) else $error("normal_op:  failed");
        assert(q_RegSrc === 1) else $error("normal_op: q_RegSrc failed");
        assert(q_MemWrite === 1) else $error("normal_op: q_MemWrite failed");
        assert(q_MemAddrSrc === 1) else $error("normal_op: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd1) else $error("normal_op: q_InstrType failed");


        #10 //another clock cycle

        d_rs = 5'd4; d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd20;  d_B = 32'd25; d_SEimm = 32'd230; d_2hr= 32'd245; 
        d_Stall = 1; d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1;
        d_InstrType = 3'd2;
        d_ALUcontrol = 4'd0;

        //regular operation
		assert(q_rs === 5'd4) else $error("normal_op: d_rs failed");
        assert(q_rd === 5'd5) else $error("normal_op: d_rd failed");
        assert(q_rt === 5'd6) else $error("normal_op: d_rt failed");

        assert(q_A === 32'd20) else $error("normal_op: q_A failed");
        assert(q_B === 32'd25) else $error("normal_op: q_B failed");
        assert(q_SEimm === 32'd230) else $error("normal_op: q_SEimm failed");
        assert(q_2hr === 32'd245) else $error("normal_op: q_2hr failed");
        assert(q_InstrType === 3'd2) else $error("normal_op: q_InstrType failed");
        

        #10 //another clock cycle

        // enable off -----------------------------------------------------------------
		reset =1'd0; en = 1'd0; 
        //change values
        d_rs = 5'd4; d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd15;  d_B = 32'd55; d_SEimm = 32'd35; d_2hr= 32'd65; 
        d_Stall = 0; d_MemtoReg = 0; d_RegSrc = 0; d_MemWrite = 0; d_MemAddrSrc = 0;
        d_InstrType = 3'd3;
        d_ALUcontrol = 4'd0;
        // #20 //one clock cycle

        // results should not be updated
         
        assert(q_rs === 5'd1) else $error("en_off: d_rs failed");
        assert(q_rd === 5'd2) else $error("en_off: d_rd failed");
        assert(q_rt === 5'd3) else $error("en_off: d_rt failed");

        assert(q_A === 32'd10) else $error("en_off: q_A failed");
        assert(q_B === 32'd5) else $error("en_off: q_B failed");
        assert(q_SEimm === 32'd30) else $error("en_off: q_SEimm failed");
        assert(q_2hr === 32'd45) else $error("en_off: q_2hr failed");

        
        assert(q_Stall === 1) else $error("en_off: q_Stall failed");
        assert(q_MemtoReg === 1) else $error("en_off: q_MemtoReg failed");
        assert(q_RegSrc === 1) else $error("en_off: q_RegSrc failed");
        assert(q_MemWrite === 1) else $error("en_off: q_MemWrite failed");
        assert(q_MemAddrSrc === 1) else $error("en_off: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd2) else $error("en_off: q_InstrType failed");


        #10 //anther clock cycle

          // reset on -----------------------------------------------------------------
		 reset =1'd1; en = 1'd1; 
        //change values
         d_rs = 5'd4; d_rd = 5'd5; d_rt = 5'd6;
        d_A = 32'd15;  d_B = 32'd55; d_SEimm = 32'd35; d_2hr= 32'd65; 
        d_Stall = 1; d_MemtoReg = 1; d_RegSrc = 1; d_MemWrite = 1; d_MemAddrSrc = 1;
        d_InstrType = 3'd1;
        d_ALUcontrol = 4'd7;
        #10 //one clock cycle

        // results should be 0
         
        assert(q_rs === 5'd0) else $error("en_off: d_rs failed");
        assert(q_rd === 5'd0) else $error("en_off: d_rd failed");
        assert(q_rt === 5'd0) else $error("en_off: d_rt failed");

        assert(q_A === 32'd0) else $error("en_off: q_A failed");
        assert(q_B === 32'd0) else $error("en_off: q_B failed");
        assert(q_SEimm === 32'd0) else $error("en_off: q_SEimm failed");
        assert(q_2hr === 32'd0) else $error("en_off: q_2hr failed");

        
        assert(q_Stall === 0) else $error("en_off: q_Stall failed");
        assert(q_MemtoReg === 0) else $error("en_off: q_MemtoReg failed");
        assert(q_RegSrc === 0) else $error("en_off: q_RegSrc failed");
        assert(q_MemWrite === 0) else $error("en_off: q_MemWrite failed");
        assert(q_MemAddrSrc === 0) else $error("en_off: q_MemAddrSrc failed");
        assert(q_InstrType === 3'd0) else $error("en_off: q_InstrType failed");

	end

	always 
		#5 clk = ~clk;

endmodule