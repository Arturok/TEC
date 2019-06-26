module AddressDecoder_tb();

	logic MemWrite;
	logic [31:0] MemAddr;
	logic DSel, reset;
	logic [1:0] WEn;
	logic [31:0] dAddr;

	AddressDecoder addr(MemWrite, MemAddr, DSel, reset, 
		WEn, dAddr);

	initial begin

//Solo lectura

		//Probar que con dirección 0, lee la memoria de datos
		MemWrite = 0; MemAddr = 32'd0; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b00 & 
			dAddr == MemAddr) else $error("Reading dataMemory direction 0: failed");

		//Probar que con dirección 63, lee la memoria de datos
		MemWrite = 0; MemAddr = 32'd63; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b00 & 
			dAddr == MemAddr) else $error("Reading dataMemory direction 63: failed");

		/*Probar que con la dirección 64 lee memoria de video
		en la dirección 0 */

		MemWrite = 0; MemAddr = 32'd64; #10;
		assert(reset == 0 & DSel == 1 & WEn == 2'b00 & 
			dAddr == (MemAddr - 32'd64)) else $error("Reading video memory position 0: failed");

		/*Probar que con la dirección 254063 lee memoria de video
		en la dirección 253999 */

		MemWrite = 0; MemAddr = 32'd254063; #10;
		assert(reset == 0 & DSel == 1 & WEn == 2'b00 & 
			dAddr == (MemAddr - 32'd64)) else $error("Reading video memory position 254000: failed");

//Escritura

		//Probar que con dirección 0, escribe la memoria de datos
		MemWrite = 1; MemAddr = 32'd0; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b01 & 
			dAddr == MemAddr) else $error("Writting dataMemory direction 0: failed");

		//Probar que con dirección 63, escribe la memoria de datos
		MemWrite = 1; MemAddr = 32'd63; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b01 & 
			dAddr == MemAddr) else $error("Writting dataMemory direction 63: failed");

		/*Probar que con la dirección 64 escribe memoria de video
		en la dirección 0 */

		MemWrite = 1; MemAddr = 32'd64; #10;
		assert(reset == 0 & DSel == 1 & WEn == 2'b10 & 
			dAddr == (MemAddr - 32'd64)) else $error("Writting video memory position 0: failed");

		/*Probar que con la dirección 254063 escribe memoria de video
		en la dirección 253999 */

		MemWrite = 1; MemAddr = 32'd254063; #10;
		assert(reset == 0 & DSel == 1 & WEn == 2'b10 & 
			dAddr == (MemAddr - 32'd64)) else $error("Writting video memory position 254000: failed");

//Probando la señal de reset con lectura
		
		MemWrite = 0; MemAddr = 32'd254064; #10;
		assert(reset == 1 & DSel == 0 & WEn == 2'b00 & 
			dAddr == 32'd0) else $error("Reset signal in reading mode: failed");

//Probando la señal de reset con escritura
		
		MemWrite = 1; MemAddr = 32'd254064; #10;
		assert(reset == 1 & DSel == 0 & WEn == 2'b00 & 
			dAddr == 32'd0) else $error("Reset signal in writting mode: failed");

//Probando cuando salidas cuando se carga una dirección inexistente en modo lectura

		MemWrite = 0; MemAddr = 32'd254065; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b00 & 
			dAddr == 32'd0) else $error("Default output in reading mode: failed");


//Probando cuando salidas cuando se carga una dirección inexistente en modo escritura

		MemWrite = 1; MemAddr = 32'd254065; #10;
		assert(reset == 0 & DSel == 0 & WEn == 2'b00 & 
			dAddr == 32'd0) else $error("Default output in writting mode: failed");

	end // initial

	endmodule // AddressDecoder_tb
