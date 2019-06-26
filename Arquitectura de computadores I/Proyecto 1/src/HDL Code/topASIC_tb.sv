module topASIC_tb ();
    
logic clk, reset;
logic vgaclk;
logic hsync, vsync, sync_b, blank_b;
logic [7:0] R, G, B;

topASIC tasic ( clk, reset, vgaclk, hsync, vsync, sync_b, blank_b, R, G, B);


// initialize test
initial
	begin
	reset <= 1;# 22; reset <= 0;
end


// generate clock to sequence tests
always
	begin
	clk <= 1; # 5; clk <= 0; # 5;
end

// // check that 7 gets written to address 0x64
// // at end of program
// always @(negedge clk)
// begin
// 	if(MemWrite)
// 	begin
// 		if(DataAdr === 100 & WriteData === 7) begin
// 			$display("Simulation succeeded");
// //			$stop;
// 		end 
// 		else if (DataAdr !== 96) 		
// 				begin
// 					$display("Simulation failed");
// //					$stop;
// 				end
// 	end
// end
endmodule