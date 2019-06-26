module freqTest32(input logic[31:0] A,
input logic clk, reset,
output  logic [31:0] Y);

freqTest #(32) test (A, clk, reset, Y);

endmodule
