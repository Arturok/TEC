module topASIC (
    input logic clk, reset,
				output logic vgaclk,
				output logic hsync, vsync, sync_b, blank_b,
				output logic [7:0] R, G, B
				);

    
logic [31:0] Instruction, extmemData;
logic memWrite;
logic [31:0] memAddr, wrData, nextPC, videoData;

logic [1:0] WEn;
logic [31:0] decAddress,RAMdata;
logic DSel, addrDecRst;
logic [9:0] hcnt, vcnt;
logic [17:0] pxlAddr;



ASIC processor(clk, reset, Instruction, extmemData, memWrite, memAddr, wrData, nextPC);


imem InstructionMemory (nextPC, Instruction);

AddressDecoder addrDec(memWrite,memAddr,DSel,addrDecRst, WEn, decAddress);



dmem DataMemory(clk, WEn[0], decAddress, wrData, RAMdata);
vmem vidMemory( clk, vgaclk, reset, WEn[1] ,blank_b, pxlAddr, decAddress, wrData, videoData, R, G, B);


Mux2x1 mxWBD (RAMdata, videoData, DSel, extmemData);




freqDivider vgaCLOCK(clk, reset, vgaclk);
               
vgaController videoController (vgaclk, reset, hsync, vsync, sync_b, blank_b, pxlAddr);




endmodule