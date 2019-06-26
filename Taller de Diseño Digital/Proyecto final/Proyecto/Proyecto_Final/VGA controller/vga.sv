module vga(input clk, reset, boton,
				output logic [7:0] R, G, B,
				output logic hsync, vsync, sync_b, blank_b, vgaclk);

//logic [1:0] tempvgaclk;
logic reg1, reg2, reg3, reg4;
logic [1:0] selectCuadrante; 
logic [9:0] hcnt, vcnt;
logic [23:0] randColor, colorC1, colorC2, colorC3, colorC4, currColor;


//assign vgaclk = tempvgaclk[1];

//control FSM
controlPintado pintor(clk, reset, boton, reg1, reg2, reg3, reg4);

//color generator
generadorColor genColor(clk, reset, randColor);

//color registers
colorRegister C1(randColor, reg1, reset, colorC1);
colorRegister C2(randColor, reg2, reset, colorC2);
colorRegister C3(randColor, reg3, reset, colorC3);
colorRegister C4(randColor, reg4, reset, colorC4);

//pixel clock generator 25Mhz
freqDivider vgaCLOCK(clk, reset, vgaclk);


//VGA controller
vgaController pantallazo(vgaclk, reset, hsync, vsync, sync_b, blank_b, hcnt, vcnt);

//select color depending on part of the screen
selectorCuadrante SC(hcnt, vcnt, selectCuadrante);

//color MUX
mux4 colorMux(colorC1, colorC2, colorC3, colorC4, selectCuadrante, currColor);


//color output
assign R = currColor[23:16];
assign G = currColor[15:8];
assign B = currColor[7:0];




endmodule