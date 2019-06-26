module mux4 #(parameter N = 4)(input logic [N - 1:0] d0, d1, d2, d3,
input logic [1:0] s,output logic [N - 1:0] y);
logic [N - 1:0] low, hi;

mux2 #(N) lowmux(d0, d1, s[0], low);
mux2 #(N) himux(d2, d3, s[0], hi);
mux2 #(N) outmux(low, hi, s[1], y);

endmodule