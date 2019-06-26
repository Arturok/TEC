module leftShifter_n_tb();

logic [7:0] A, Y;
logic [2:0] B; 

// instantiate device under test
leftShifter_n dut(A, B, Y);
// apply inputs one at a time
// checking results
initial begin
A = 0; B = 0; #10;
assert (Y === 0) else $error("left shift 0 failed");
A = 1; B = 1; #10;
assert (Y === 2) else $error("1 << 1 == 2 failed.");
A = 1; B = 2; #10;
assert (Y === 4) else $error("1 << 2 == 4 failed.");
A = 1; B = 5; #10;
assert (Y === 32) else $error("1 << 5 == 32 failed.");
A = 5; B = 2; #10;
assert (Y === 20) else $error("5 << 2 == 20 failed.");

end
endmodule
