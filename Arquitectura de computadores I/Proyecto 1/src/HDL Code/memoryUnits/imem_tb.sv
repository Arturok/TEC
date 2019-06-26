module imem_tb();

logic [31:0] a, ir;

// instantiate device under test
imem dut(a, ir);

initial begin

//Instruction 0
a='b0000; #10;
assert (ir === 'b11100000010011110000000000001111) else $error("First instruction failed");

//Instruction 1
a='b0100; #10;
assert (ir === 'b11100010100000000010000000000101) else $error("Second instruction failed");

//Instruction 8
a='b00100000; #10;
assert (ir === 'b00001010000000000000000000001100) else $error("Instruction #8 failed");

//Instruction 23
a='b01011000; #10;
assert (ir === 'b11100101100000000010000001100100) else $error("Instruction #23 failed");






end
endmodule

