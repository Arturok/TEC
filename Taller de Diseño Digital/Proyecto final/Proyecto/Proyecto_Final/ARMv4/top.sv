module top(input logic clk, reset, 
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite,
				output logic vgaclk,
				output logic hsync, vsync, sync_b, blank_b,
				output logic [7:0] R, G, B,
				input logic iPS2_clk, iPS2_data);
				
//arm signals				
logic [31:0] PC, Instr, ReadData, RamData, BicData, ObsData, ps2Data;
logic Interrupt, IntReset, WeRam, WeBic, WeObs, DataSel;

//sprite signals
logic [9:0] hcnt, vcnt;
//logic [31:0] currY;
logic visible;




// instantiate processor and memories
arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
			WriteData, ReadData, Interrupt, IntReset);
			
imem imem(PC, Instr);


//address decoder
AddrDecoder ad (DataAdr, MemWrite, WeRam, WeBic, WeObs, DataSel);


//memory mapped I/O

//flopenr #(32) RAMreg (clk, reset, WeRam, WriteData, RamData);
dmem dmem(clk, WeRam, DataAdr, WriteData, ReadData);


flopenr #(32) Bicreg (clk, reset, WeBic, WriteData, BicData);
bichitoSprite bichito(hcnt, vcnt ,BicData, R, G, B, visible);

flopenr #(32) Obsreg (clk, reset, WeObs, WriteData, ObsData);
bichitoSprite obstaculo(hcnt, vcnt , ObsData, R, G, B, visible);

backgroundSprite background( hcnt, vcnt , R, G, B);



//PS/2
ps2KeyboardController ps2kc (iPS2_clk, clk, iPS2_data, ps2Data, Interrupt);
flopenr #(32) ps2reg (clk, reset, WeBic, WriteData, ps2Data);



//VGA

//pixel clock generator 25Mhz
freqDivider vgaCLOCK(clk, reset, vgaclk);

//VGA controller
vgaController pantallazo(vgaclk, reset, hsync, vsync, sync_b, blank_b, hcnt, vcnt);


endmodule
