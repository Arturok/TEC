module vga_tb();

logic  clk = 0, reset, boton;
logic [7:0] R, G, B;
logic hsync, vsync, sync_b, blank_b;

always #1 clk = ~clk;

// instantiate device under test
vga dut(clk, reset, boton, R, G, B, hsync, vsync, sync_b, blank_b);


initial begin

reset=1; boton=0; #10 reset=0;


boton = 1; #40 boton = 0;

#100 boton = 1; #10 boton = 0;

#100 boton = 1; #10 boton = 0;

#100 boton = 1; #10 boton = 0;

#100 boton = 1; #10 boton = 0;

#100 boton = 1; #1 boton = 0;

 




end

endmodule