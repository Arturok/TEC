module freqTest256(input logic[255:0] A,
input logic clk, reset,
output  logic [255:0] Y);

freqTest #(256) test (A, clk, reset, Y);

endmodule
