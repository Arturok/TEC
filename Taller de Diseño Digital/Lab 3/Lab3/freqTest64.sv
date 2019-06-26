module freqTest64 (input logic[63:0] A,
input logic clk, reset,
output  logic [63:0] Y);

freqTest #(64) test (A, clk, reset, Y);

endmodule
