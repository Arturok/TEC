//vga.txt
//
//
//
//vga.sv
//module vga(input logic clk,
//output logic vgaclk, // 25.175 MHz VGA clock
//output logic hsync, vsync,
//output logic sync_b, blank_b, // To monitor & DAC
//output logic [7:0] r, g, b); // To video DAC
//logic [9:0] x, y;
//// Use a PLL to create the 25.175 MHz VGA pixel clock
//// 25.175 MHz clk period = 39.772 ns
//// Screen is 800 clocks wide by 525 tall, but only 640 x 480 used
//// HSync = 1/(39.772 ns *800) = 31.470 kHz
//// Vsync = 31.474 kHz / 525 = 59.94 Hz (~60 Hz refresh rate)
//pll vgapll(.inclk0(clk), .c0(vgaclk));
//// Generate monitor timing signals
//vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
//// User-defined module to determine pixel color
//videoGen videoGen(x, y, r, g, b);
//endmodule
//
//
//
//
//
//module videoGen(inputlogic [9:0] x, y, output logic [7:0] r, g, b);
//
//
//logic pixel, inrect;
//// Given y position, choose a character to display
//// then look up the pixel value from the character ROM
//// and display it in red or blue.Also draw a green rectangle.
//chargenrom chargenromb(y[8:3] + 8’d65, x[2:0], y[2:0], pixel);
//rectgen rectgen(x, y, 10’d120, 10’d150, 10’d200, 10’d230, inrect);
//assign {r, b} = (y[3]==0) ? {{8{pixel}},8’h00} : {8’h00,{8{pixel}}};
//assign g = inrect ? 8’hFF : 8’h00;
//endmodule
//
//
//
//
//module chargenrom(input logic [7:0] ch,
//input logic [2:0] xoff, yoff,
//output logic pixel);
//logic [5:0] charrom[2047:0]; // character generator ROM
//logic [7:0] line; // a line read from the ROM
//// Initialize ROM with characters from text file
//initial
//$readmemb("charrom.txt", charrom);
//// Index into ROM to find line of character
//assign line = charrom[yoff + {ch-65, 3’b000}]; // Subtract 65 because A
//// is entry 0
//// Reverse order of bits
//assign pixel = line[3’d7-xoff];
//endmodule
//
//
//
//
//module rectgen(input logic [9:0] x, y, left, top, right, bot,
//output logic inrect);
//assign inrect = (x > = left & x < right & y > = top & y < bot);
//endmodule
//
//
//
//charrom.txt
//// A ASCII 65
//011100
//100010
//100010
//111110
//100010
//100010
//100010
//000000
////B ASCII 66
//111100
//100010
//100010
//111100
//100010
//100010
//111100
//000000
////C ASCII 67
//011100
//100010
//100000
//100000
//100000
//100010
//011100
//000000