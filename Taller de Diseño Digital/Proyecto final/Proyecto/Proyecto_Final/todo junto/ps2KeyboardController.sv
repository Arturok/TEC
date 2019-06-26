module ps2KeyboardController(input logic iPS2_clk, iCLK, iPS2_data,
					  output logic [31:0] oPos,
					  output logic interrupt);
	
	logic [7:0] arrow_up = 8'h75;					//Up arrow makecode
	logic [7:0] arrow_down = 8'h72;					//Down arrow makecode
	logic [7:0] breakcode = 8'hF0;					//General Breakcode
	logic [7:0] releasecode = 8'hE0;					//General first makecode of the arrow keys, to set break_flag to 0
	
	reg break_flag;										//1 if de previous code was F0, to block the next code
	
	//reg [1:0] posicion;
	
	reg read; 												//Este es 1 si aún espera recibir más bits
	reg [11:0] count_reading;							//Este es usado para detectar cuanto tiempo ha pasado desde que se recibió el anterior CODEWORD
	reg PREVIOUS_STATE;									//Este es usado para verificar el estado anterior de la señal del reloj del teclado para saber si cambió
	reg scan_err;											//Esto se convierte en 1 si se recibió un error en algún lugar del paquete
	reg [10:0] scan_code;								//Esto almacena 11 bits recibidos
	reg [7:0] CODEWORD;									//Esto almacena solo el DATA codeword
	reg TRIG_ARR;											//Esto se activa cuando se reciben 11 bits completos
	reg [3:0]COUNT;										//Indica cuántos bits se recibieron hasta ahora (de 0 a 11)
	reg TRIGGER = 0;										//This acts as a 250 times slower than the board clock.
	reg [7:0]DOWNCOUNTER = 0;							//Esto se usa junto con el TRIGGER - ver el código
	
	//Valores iniciales
	initial begin
		PREVIOUS_STATE = 1;		
		scan_err = 0;		
		scan_code = 0;
		COUNT = 0;			
		CODEWORD = 0;
		read = 0;
		count_reading = 0;
		//oKeyCode = 0;
		break_flag = 0;
		//posicion = 1;
	end
	
	always @(posedge iCLK) begin						//Esto reduce la frecuencia 250 veces.
		if (DOWNCOUNTER < 249) begin
			DOWNCOUNTER <= DOWNCOUNTER + 1;
			TRIGGER <= 0;
		end
		else begin
			DOWNCOUNTER <= 0;
			TRIGGER <= 1;
		end
		
	end
	
	always @(posedge iCLK) begin	
		if (TRIGGER) begin
			if (read)										//si todavía espera leer el paquete completo de 11 bits, entonces (read = 1)
				count_reading <= count_reading + 1;	//and it counts up this variable
			else 												//and later if check to see how big this value is.
				count_reading <= 0;						//if it is too big, then it resets the received data
		end
	end
	
	always @(posedge iCLK) begin		
	if (TRIGGER) begin									//Si el DOWNCOUNTER (CLK/250) está listo
		if (iPS2_clk != PREVIOUS_STATE) begin		//Si el estado del pin del reloj cambió del estado anterior
			if (!iPS2_clk) begin							//Y si el reloj del teclado está en el falling edge
				read <= 1;									//Marca que todavía está leyendo para el siguiente bit
				scan_err <= 0;								//Sin errores
				scan_code[10:0] <= {iPS2_data, scan_code[10:1]};	//suma los datos recibidos desplazando los bits y añadiento 1 nuevo bit.
				COUNT <= COUNT + 1;			
			end
		end
		else if (COUNT == 11) begin					//Si ya recibieron los 11 bits
			COUNT <= 0;
			read <= 0;										//marca que la lectura se detuvo
			TRIG_ARR <= 1;									//Indica que se recibió el paquete completo de 11 bits
			
			//calcula el scan_err usando un bit de paridad
			if (!scan_code[10] || scan_code[0] || !(scan_code[1]^scan_code[2]^scan_code[3]^scan_code[4]
				^scan_code[5]^scan_code[6]^scan_code[7]^scan_code[8]^scan_code[9]))
				scan_err <= 1;
			else 
				scan_err <= 0;
		end
		else  begin											//Si aún no ha recibido el paquete completo de 11 bits.
			TRIG_ARR <= 0;									//dice que el paquete de 11 bits no fue recibido todavía
			if (COUNT < 11 && count_reading >= 4000) begin	//y si después de un cierto tiempo no se recibieron más bits, entonces
				COUNT <= 0;									//restablecer el número de bits recibidos
				read <= 0;									//y espera el siguiente paquete
			end
		end
	PREVIOUS_STATE <= iPS2_clk;						//Marca el estado anterior del reloj del teclado.
	end
	end
	
	always @(posedge iCLK) begin
		if (TRIGGER) begin								//Si el reloj 250 veces más lento se dispara
			if (TRIG_ARR) begin							//y si se recibió un paquete completo de 11 bits
				if (scan_err) begin						//PERO si el paquete NO estaba bien
					CODEWORD <= 8'd0;						//Entonces se reinicia el registro del CODEWORD
				end
				else begin
					CODEWORD <= scan_code[8:1];		//Sino, quita los bits innecesarios y transporta los 7 bits de DATOS al CODEWORD reg
				end											//notice, that the codeword is also reversed! This is because the first bit to received
			end												//Se supone que es el último bit en el CODEWORD ...
			else begin
				CODEWORD <= 8'd0;							//no se recibió un paquete completo, por lo tanto se reinicia el CODEWORD
			end
		end
		else CODEWORD <= 8'd0;							//no clock trigger, no data…
	end
	
	always @(posedge iCLK) begin
		
		if (CODEWORD == releasecode) begin			//Si CODEWORD tiene el mismo código que el releasecode
			break_flag <= 0;
		end		
		else if (CODEWORD == breakcode) begin		//Si el CODEWORD tiene el mismo código que el breakcode
			break_flag <= 1;
		end		
		else if (CODEWORD == arrow_up) begin					//Si CODEWORD tiene el mismo código que el código arrow_up
			if(!break_flag) begin
				oPos <= {26'b0,arrow_up};
				interrupt <= 1;
				//oKeyCode <= CODEWORD;
			end												
		end
		else if (CODEWORD == arrow_down)	begin			//o si se presionó el arrow_down, entonces
			if(!break_flag) begin
				oPos <= {26'b0,arrow_down};
				interrupt <= 1;
				//oKeyCode <= CODEWORD;				
			end
		end
		else begin
			oPos <= 32'b0;
			interrupt <= 0;
		end
	end


endmodule 