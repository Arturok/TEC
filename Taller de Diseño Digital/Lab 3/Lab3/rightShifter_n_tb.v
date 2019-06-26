module rightShifter_n_tb();

logic [7:0] A, Y;
logic [2:0] B; 

// instantiate device under test
rightShifter_n dut(A, B, Y);
// apply inputs one at a time
// checking results
initial begin
A = 0; B = 0; #10;
assert (Y === 0) else $error("0 >> 0 failed");
A = 1; B = 1; #10;
assert (Y === 0) else $error("1 >> 1 == 0 failed.");
A = 4; B = 1; #10;
assert (Y === 2) else $error("4 >> 1 == 2 failed.");
A = 8; B = 3; #10;
assert (Y === 1) else $error("8 >> 3 == 1 failed.");
A = 7; B = 1; #10;
assert (Y === 3) else $error("7 >> 1 == 3 failed.");

end
endmodule
