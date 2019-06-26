module AddressDecoder(
		input logic MemWrite,
		input logic [31:0] MemAddr,
		output logic DSel, reset,
		output logic [1:0] WEn,
		output logic [31:0] dAddr
	);

typedef struct packed
{
	logic sel, rst;
	logic [1:0] en;
	logic [31:0] addr;
} controls;

controls ctrls1;

always_comb begin

	if(MemWrite == 1) begin

		if(MemAddr < 32'd64) begin

			ctrls1.rst = 0;
			ctrls1.sel = 0;
			ctrls1.en = 2'b01;
			ctrls1.addr = MemAddr;

		end
		else if ((MemAddr > 32'd63) & (MemAddr < 32'd254064)) begin

			ctrls1.rst = 0;
			ctrls1.sel = 1;
			ctrls1.en = 2'b10;
			ctrls1.addr = MemAddr - 32'd64;

		end
		else if(MemAddr == 32'd254064)begin

			ctrls1.rst = 1;
			ctrls1.sel = 0;
			ctrls1.en = 2'b00;
			ctrls1.addr = 32'd0;

		end
		else begin

			ctrls1.rst = 0;
			ctrls1.sel = 0;
			ctrls1.en = 2'b00;
			ctrls1.addr = 32'd0;

		end

	end
	else begin

		if(MemAddr < 32'd64) begin

			ctrls1.rst = 0;
			ctrls1.sel = 0;
			ctrls1.en = 2'b00;
			ctrls1.addr = MemAddr;

		end
		else if ((MemAddr > 32'd63) & (MemAddr < 32'd254064)) begin

			ctrls1.rst = 0;
			ctrls1.sel = 1;
			ctrls1.en = 2'b00;
			ctrls1.addr = MemAddr - 32'd64;

		end

		else if(MemAddr == 32'd254064)begin

			ctrls1.rst = 1;
			ctrls1.sel = 0;
			ctrls1.en = 2'b00;
			ctrls1.addr = 32'd0;

		end

		else begin

			ctrls1.rst = 0;
			ctrls1.sel = 0;
			ctrls1.en = 2'b00;
			ctrls1.addr = 32'd0;

		end

	end
end


assign DSel = ctrls1.sel;
assign reset = ctrls1.rst;
assign WEn = ctrls1.en;
assign dAddr = ctrls1.addr;

endmodule 