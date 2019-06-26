module alu_n_tb();

logic [7:0] A, B, Y;
logic [3:0] ctrl;
logic Zero, Overflow, Negative, Carry;

// instantiate device under test
alu_n #(4) dut(A, B, ctrl, Y, Zero, Overflow, Negative, Carry);
// apply inputs one at a time
// checking results
initial begin
//SUMA ctrl=0
//0 + 0
A = 0; B = 0; ctrl=0; #10;
assert (Y === 0) else $error("0 + 0 = 0 failed");
assert (Zero === 1) else $error("0+0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("0+0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("0+0 Operation, Negative flag failed");
assert (Carry === 0) else $error("0+0 Operation, Carry flag failed");

//2 + 2
A = 2; B = 2; ctrl=0; #10;
assert (Y === 4) else $error("2 + 2 = 4 failed.");
assert (Zero === 0) else $error("2 + 2 Operation, Zero flag failed");
assert (Overflow === 0) else $error("2 + 2 Operation, Overflow flag failed");
assert (Negative === 0) else $error("2 + 2 Operation, Negative flag failed");
assert (Carry === 0) else $error("2 + 2 Operation, Carry flag failed");

//7 + 4
A = 'b0111; B = 'b0100; ctrl=0; #10;
assert (Y === 'b1011) else $error("7 + 4 =  failed.");
assert (Zero === 0) else $error("7 + 4 Operation, Zero flag failed");
assert (Overflow === 1) else $error("7 + 4 Operation, Overflow flag failed");
assert (Negative === 1) else $error("7 + 4 Operation, Negative flag failed");
assert (Carry === 0) else $error("7 + 4 Operation, Carry flag failed");

//7 + 0
A = 7; B = 0; ctrl=0; #10;
assert (Y === 7) else $error("7 + 0 = 1 failed.");
assert (Zero === 0) else $error("7 + 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("7 + 0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("7 + 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("7 + 0 Operation, Carry flag failed");



//RESTA ctrl=1
// 2 - 4
A = 2; B = 4; ctrl=1; #10;
assert (Y === ('b1110)) else $error("2 - 4 = -2 failed.");
assert (Zero === 0) else $error("2 - 4 Operation, Zero flag failed");
assert (Overflow === 0) else $error("2 - 4 Operation, Overflow flag failed");
assert (Negative === 1) else $error("2 - 4 Operation, Negative flag failed");
assert (Carry === 0) else $error("2 - 4 Operation, Carry flag failed");

//7 - 4
A = 7; B = 4; ctrl=1; #10;
assert (Y === 3) else $error("7 - 4= 3 failed.");
assert (Zero === 0) else $error("7 - 4 Operation, Zero flag failed");
assert (Overflow === 0) else $error("7 - 4 Operation, Overflow flag failed");
assert (Negative === 0) else $error("7 - 4 Operation, Negative flag failed");
assert (Carry === 1) else $error("7 - 4 Operation, Carry flag failed");

//5 - 5
A = 'b0101; B = 'b0101; ctrl=1; #10;
assert (Y === 'b0000) else $error("5 - 5 = 0 failed.");
assert (Zero === 1) else $error("5 - 5 Operation, Zero flag failed");
assert (Overflow === 0) else $error("5 - 5 Operation, Overflow flag failed");
assert (Negative === 0) else $error("5 - 5 Operation, Negative flag failed");
assert (Carry === 1) else $error("5 - 5 Operation, Carry flag failed");


//0 - 0
A = 0; B = 0; ctrl=1; #10;
assert (Y === 0) else $error("0 - 0 = 0 failed.");
assert (Zero === 1) else $error("0 - 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("0 - 0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("0 - 0 Operation, Negative flag failed");
assert (Carry === 1) else $error("0 - 0 Operation, Carry flag failed");


//AND ctrl=2
//1 AND 1
A = 1; B = 1; ctrl=2; #10;
assert (Y === 1) else $error("1 AND 1 = 1 failed.");
assert (Zero === 0) else $error("1 AND 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 AND 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("1 AND 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("1 AND 1 Operation, Carry flag failed");

//4 AND 2
A = 4; B = 2; ctrl=2; #10;
assert (Y === 0) else $error("4 AND 2 = 0 failed.");
assert (Zero === 1) else $error("4 AND 2 Operation, Zero flag failed");
assert (Overflow === 0) else $error("4 AND 2 Operation, Overflow flag failed");
assert (Negative === 0) else $error("4 AND 2 Operation, Negative flag failed");
assert (Carry === 0) else $error("4 AND 2 Operation, Carry flag failed");

//5 AND 5
A = 5; B = 5; ctrl=2; #10;
assert (Y === 5) else $error("5 AND 5 = 5 failed.");
assert (Zero === 0) else $error("5 AND 5 Operation, Zero flag failed");
assert (Overflow === 0) else $error("5 AND 5 Operation, Overflow flag failed");
assert (Negative === 0) else $error("5 AND 5 Operation, Negative flag failed");
assert (Carry === 0) else $error("5 AND 5 Operation, Carry flag failed");

//7 AND 0
A = 7; B = 0; ctrl=2; #10;
assert (Y === 0) else $error("7 AND 0 = 0 failed.");
assert (Zero === 1) else $error("7 AND 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("7 AND 05 Operation, Overflow flag failed");
assert (Negative === 0) else $error("7 AND 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("7 AND 0 Operation, Carry flag failed");


//NOT ctrl=3
//NOT 1
B = 'b0001; ctrl=3; #10;
assert (Y === 'b1110) else $error("NOT 0001 = 1110 failed.");
assert (Zero === 0) else $error("NOT 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("NOT 1 Operation, Overflow flag failed");
assert (Negative === 1) else $error("NOT 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("NOT 1 Operation, Carry flag failed");


//NOT 7
B = 7; ctrl=3; #10;
assert (Y === 'b1000) else $error("NOT 7 = 1000 failed.");
assert (Zero === 0) else $error("NOT 7 Operation, Zero flag failed");
assert (Overflow === 0) else $error("NOT 7 Operation, Overflow flag failed");
assert (Negative === 1) else $error("NOT 7 Operation, Negative flag failed");
assert (Carry === 0) else $error("NOT 7 Operation, Carry flag failed");

//NOT -2
B = -2; ctrl=3; #10;
assert (Y === 'b0001) else $error("NOT -2 = 1000 failed.");
assert (Zero === 0) else $error("NOT -2 Operation, Zero flag failed");
assert (Overflow === 0) else $error("NOT -2 Operation, Overflow flag failed");
assert (Negative === 0) else $error("NOT -2 Operation, Negative flag failed");
assert (Carry === 0) else $error("NOT -2 Operation, Carry flag failed");

//NOT 0
B = 0; ctrl=3; #10;
assert (Y === 'b1111) else $error("NOT 0 = 1111 failed.");
assert (Zero === 0) else $error("NOT 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("NOT 0 Operation, Overflow flag failed");
assert (Negative === 1) else $error("NOT 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("NOT 0 Operation, Carry flag failed");


//OR ctrl=4
//1 OR 1
A = 1; B = 1; ctrl=4; #10;
assert (Y === 1) else $error("1 OR 1 = 1 failed.");
assert (Zero === 0) else $error("1 OR 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 OR 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("1 OR 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("1 OR 1 Operation, Carry flag failed");

//4 OR 0
A = 4; B = 0; ctrl=4; #10;
assert (Y === 4) else $error("4 OR 0 = 4 failed.");
assert (Zero === 0) else $error("4 OR 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("4 OR 0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("4 OR 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("4 OR 0 Operation, Carry flag failed");

//0 OR 0
A = 0; B = 0; ctrl=4; #10;
assert (Y === 0) else $error("0 OR 0 = 0 failed.");
assert (Zero === 1) else $error("0 OR 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("0 OR 0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("0 OR 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("0 OR 0 Operation, Carry flag failed");

//3 OR -5
A = 3; B = -5; ctrl=4; #10;
assert (Y === 'b1011) else $error("3 OR -5 = -5 failed.");
assert (Zero === 0) else $error("3 OR -5 Operation, Zero flag failed");
assert (Overflow === 0) else $error("3 OR -5 Operation, Overflow flag failed");
assert (Negative === 1) else $error("3 OR -5 Operation, Negative flag failed");
assert (Carry === 0) else $error("3 OR -5 Operation, Carry flag failed");

//XOR ctrl=5
//1 XOR 1
A = 'b0001; B = 'b0001; ctrl=5; #10;
assert (Y === 'b0000) else $error("1 XOR 1 = 0 failed.");
assert (Zero === 1) else $error("1 XOR 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 XOR 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("1 XOR 1 Operation, Negative flag failed");
assert (Carry === 1) else $error("1 XOR 1 Operation, Carry flag failed");

//1 XOR 0
A = 'b0001; B = 'b0000; ctrl=5; #10;
assert (Y === 'b0001) else $error("1 XOR 0 = 1 failed.");
assert (Zero === 0) else $error("1 XOR 0 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 XOR 0 Operation, Overflow flag failed");
assert (Negative === 0) else $error("1 XOR 0 Operation, Negative flag failed");
assert (Carry === 0) else $error("1 XOR 0 Operation, Carry flag failed");

//1 XOR 5
A = 'b0001; B = 'b0101; ctrl=5; #10;
assert (Y === 'b0100) else $error("1 XOR 5 = 4 failed.");
assert (Zero === 0) else $error("1 XOR 5 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 XOR 5 Operation, Overflow flag failed");
assert (Negative === 0) else $error("1 XOR 5 Operation, Negative flag failed");
assert (Carry === 0) else $error("1 XOR 5 Operation, Carry flag failed");

//1 XOR -5
A = 'b0001; B = 'b1011; ctrl=5; #10;
assert (Y === 'b1010) else $error("1 XOR -5 = -6 failed.");
assert (Zero === 0) else $error("1 XOR 5 Operation, Zero flag failed");
assert (Overflow === 0) else $error("1 XOR 5 Operation, Overflow flag failed");
assert (Negative === 1) else $error("1 XOR 5 Operation, Negative flag failed");
assert (Carry === 0) else $error("1 XOR 5 Operation, Carry flag failed");


//Shif left ctrl=6
//Shif left 'b0001 << 2
A = 2; B = 'b0001; ctrl=6; #10;
assert (Y === 'b0100) else $error("'b0001 << 2 = 'b0100 failed.");
assert (Zero === 0) else $error("'b0001 << 2 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b0001 << 2 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b0001 << 2 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b0001 << 2 Operation, Carry flag failed");

//Shif left 'b1001 << 1
A = 1; B = 'b1001; ctrl=6; #10;
assert (Y === 'b0010) else $error("'b1001 << 1 = 'b0010 failed.");
assert (Zero === 0) else $error("''b1001 << 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1001 << 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b1001 << 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1001 << 1 Operation, Carry flag failed");

//Shif left 'b0101 << 1
A = 1; B = 'b0101; ctrl=6; #10;
assert (Y === 'b1010) else $error("'b0101 << 1 = 'b1010 failed.");
assert (Zero === 0) else $error("'b0101 << 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b0101 << 1 Operation, Overflow flag failed");
assert (Negative === 1) else $error("'b0101 << 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b0101 << 1 Operation, Carry flag failed");

//Shif left 'b1000 << 1
A = 1; B = 'b1000; ctrl=6; #10;
assert (Y === 'b0000) else $error("'b1000 << 1 = 'b0000 failed.");
assert (Zero === 1) else $error("'b1000 << 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1000 << 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b1000 << 1Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1000 << 1 Operation, Carry flag failed");


//Shif right ctrl=7
//Shif right 'b0001 >> 1
A = 'b0001; B = 'b0001; ctrl=7; #10;
assert (Y === 'b0000) else $error("'b0001 >> 1 = 'b0000 failed.");
assert (Zero === 1) else $error("'b0001 >> 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b0001 >> 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b0001 >> 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b0001 >> 1 Operation, Carry flag failed");

//Shif right 'b1000 >> 1
A = 1; B = 'b1000; ctrl=7; #10;
assert (Y === 'b0100) else $error("'b1000 >> 1 = 'b0100 failed.");
assert (Zero === 0) else $error("'b1000 >> 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1000 >> 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b1000 >> 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1000 >> 1 Operation, Carry flag failed");

//Shif right 'b1111 >> 2
A = 2; B = 'b1111; ctrl=7; #10;
assert (Y === 'b0011) else $error("'b1111 >> 2 = 'b0011 >> 1 failed.");
assert (Zero === 0) else $error("'b1111 >> 2 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1111 >> 2 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b1111 >> 2 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1111 >> 2 Operation, Carry flag failed");

//Shif right 'b0111 >> 3
A = 'b0011; B = 'b0111; ctrl=7; #10;
assert (Y === 'b0000) else $error("'b0111 >> 3 = 'b0000 >> 1 failed.");
assert (Zero === 1) else $error("'b0111 >> 3 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b0111 >> 3 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b0111 >> 3 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b0111 >> 3 Operation, Carry flag failed");

//Arith Shift ctrl=8
//Arith Shift 'b0001 >>> 1
A = 'b0001; B = 'b0001; ctrl=8; #10;
assert (Y === 'b0000) else $error("'b0001 >>> 1 = 'b0000 failed.");
assert (Zero === 1) else $error("'b0001 >>> 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b0001 >>> 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b0001 >>> 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b0001  >>> 1 Operation, Carry flag failed");


//Arith Shift 'b1001 >>> 1
A = 'b0001; B = 'b1001; ctrl=8; #10;
assert (Y === 'b1100) else $error("'b1001 >>> 1 = 'b1100 failed.");
assert (Zero === 0) else $error("'b1001 >>> 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1001 >>> 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b0001 A >>> 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1001 >>> 1 Operation, Carry flag failed");

//Arith Shift 'b1101 >>> 1
A = 'b0001; B = 'b1101; ctrl=8; #10;
assert (Y === 'b1110) else $error("'b1101 >>> 1 = 'b1100 failed.");
assert (Zero === 0) else $error("'b1101 >>> 1 Operation, Zero flag failed");
assert (Overflow === 0) else $error("'b1101 >>> 1 Operation, Overflow flag failed");
assert (Negative === 0) else $error("'b1101 >>> 1 Operation, Negative flag failed");
assert (Carry === 0) else $error("'b1101 >>> 1 Operation, Carry flag failed");

end


endmodule
