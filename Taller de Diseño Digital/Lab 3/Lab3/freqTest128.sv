module freqTest128(input logic[127:0] A,
input logic clk, reset,
output  logic [127:0] Y);

freqTest #(128) test (A, clk, reset, Y);

endmodule
