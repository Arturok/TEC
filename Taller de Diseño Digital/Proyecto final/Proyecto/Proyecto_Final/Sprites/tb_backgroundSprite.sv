module tb_backgroundSprite();


logic [9:0] x,y;
logic [7:0] R, G, B;
logic [31:0] currY;
logic visible, reset, clk;

//backgroundSprite dut(x,y,currY,R,G,B);
bichitoSprite dut(x,y,currY,R,G,B, visible);

//BASE_XPOS = 10'd315,
//BASE_YPOS = 10'd240,


/// generate clock to sequence tests
always
	begin
	clk <= 1; # 1; clk <= 0; # 1;
end

always_ff @(posedge clk, posedge reset) begin
	//set everything to start condition
	if (reset) begin
		x = 10'd300;
		y = 10'd243;
	end
	else begin
		x = x + 10'b01; //increment horizontal count
		if (x == 10'd640) begin //if we completed one horizontal cycle
			x = 10'd300;//return count to 0
			y = y + 10'd01; //increment vertical counter
			if (y == 10'd480) y = 10'd240; //return counter to 0 when we reach end of cycle
		end
	end
end

initial begin

reset= 1; #15 reset=0;
//x=0; y=0; #5
//
//x= 10'd317; y = 10'd243; #5
//
//x= 10'd318; y = 10'd243; 

end


endmodule
