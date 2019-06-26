module generadorColor 
(input logic clk, reset,
output logic [23:0] color);

logic [3:0] R, G;
logic [0:3] G2, B2;
logic [7:0] R2;

n_counter #(4) randColor1(clk,reset,R);
n_counter_rand1 randColor2(clk,reset,G);
//n_counter #(4) randColor3(clk,reset,B);

//mirrored
n_counter #(8) randColor4(clk,reset,R2);
n_counter_rand1 randColor5(clk,reset,G2);
n_counter #(4) randColor6(clk,reset,B2);

assign color = {R, B2, R2, G, G2};

endmodule