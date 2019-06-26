module vmem_tb ();
    
logic clk, reset, we;
logic [17:0] pxlAddr;
logic [31:0] wrAddr, wrData;
logic [7:0] R, G, B;
// instantiate device under test
vmem dut(clk, reset, we, pxlAddr, wrAddr, wrData, R, G, B);

initial begin
//initialize clock
clk=1'b1;
//initialize memory to 0s
reset =1;


#5 
reset = 0; we= 0;

//read any position should be 0
pxlAddr = 18'd35;
#5

assert (R === 8'b0 & G === 8'b0 & B === 8'b0) else $error("Error: Reading after reset, everything should be 0");

//Writing something on pos 0 
 we=1'b1; wrAddr=32'd0; wrData=32'h11223300; pxlAddr = 'b0; #10

assert (R === 8'h11 & G === 8'h22 & B === 8'h33) else $error("Error: Reading pos 0");

//Writing outside of memory lenght
 we=1'b1; wrAddr= 32'hffffffff; wrData=32'h11223300; pxlAddr = {16'hffff,2'b11}; #10

assert (R === 8'h11 & G === 8'h22 & B === 8'h33) else $error("Error: Reading pos 0");

end
    always 
		#5 clk = ~clk;
endmodule