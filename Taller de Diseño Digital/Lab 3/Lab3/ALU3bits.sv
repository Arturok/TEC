module ALU3bits(

input logic  [2:0] A,B,
input logic [3:0] ctrl,
output logic Zero, Overflow, Negative, Carry,
output logic [6:0] Osegmento
);

logic [2:0] Y;

alu_n #(3) dut(A, B, ctrl, Y, Zero, Overflow, Negative, Carry);
seven_seg_decoder u1 (.data(Y), .segments(Osegmento));

endmodule