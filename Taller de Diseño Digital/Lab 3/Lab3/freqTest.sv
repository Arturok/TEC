module freqTest #(parameter N=8)
(input logic[N-1:0] A,
input logic clk, reset,
output  logic [N-1:0] Y);

logic [N-1:0] datain, rin_data_out, alu_out;
logic [3:0] control;
logic Zero, Overflow, Negative, Carry;
assign control = 'b0001;

register_n #(N) regin (A,clk, reset,rin_data_out);
register_n #(N) regout (alu_out,~clk, reset,Y);
alu_n #(N) alulu (rin_data_out, rin_data_out, control,alu_out, Zero, Overflow, Negative, Carry);

endmodule
