module vgaspritetests(input clk, reset, boton,
							output logic [7:0] R, G, B,
							output logic hsync, vsync, sync_b, blank_b, vgaclk);

 
logic [9:0] hcnt, vcnt;
logic [31:0] currY;
logic visible;

//pixel clock generator 25Mhz
freqDivider vgaCLOCK(clk, reset, vgaclk);

//VGA controller
vgaController pantallazo(vgaclk, reset, hsync, vsync, sync_b, blank_b, hcnt, vcnt);

bichitoSprite dut(hcnt, vcnt ,currY,R,G,B, visible);

endmodule
