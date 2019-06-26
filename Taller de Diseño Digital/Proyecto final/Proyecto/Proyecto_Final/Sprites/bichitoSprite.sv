module bichitoSprite #(parameter BASE_XPOS = 10'd315,
											BASE_YPOS = 10'd240,
											BLACK = 8'hff,
											WHITE = 8'h00)
						(input logic [9:0] x_pos, y_pos,
							input logic [31:0] currY,
							output logic [7:0] R, G, B,
							output logic visible);

//define the inner indices for the sprite							
logic [9:0] inner_x, inner_y;
logic pintar;

assign inner_x= x_pos - BASE_XPOS;
assign inner_y= y_pos - BASE_YPOS;

//iterator for the sprite
logic curr_color;

//initialize 16x7 2d array containing the sprite				
logic bichito [0:15][0:7] = '{
'{0, 0, 0, 0, 0, 0, 0,0}, 
'{0, 0, 0, 0, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{1, 0, 0, 1, 0, 0, 1,0}, 
'{1, 0, 0, 1, 0, 0, 1,0}, 
'{1, 0, 0, 1, 0, 0, 1,0}, 
'{1, 0, 0, 1, 0, 0, 1,0}, 
'{1, 0, 0, 1, 0, 0, 1,0}, 
'{1, 1, 1, 1, 1, 1, 1,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}, 
'{0, 0, 0, 1, 0, 0, 0,0}
};

assign pintar= (inner_x >= 0 & inner_x <= 10'd7 & inner_y >= 0 & inner_y <= 10'd15);

assign curr_color = pintar ? bichito[inner_y][inner_x] : 0;

//always_comb 
////begin
//if (pintar)
//	curr_color <= bichito[inner_y][inner_x];
//else
//	curr_color <= 0;
	
always_comb	
case (curr_color)
	0: begin 
		R = WHITE;
		G = WHITE;
		B = WHITE;
		visible = 0;
		end
	
	
	1: begin 
		R = BLACK;
		G = BLACK;
		B = BLACK;
		visible = 1;
		end
	default: 
		begin 
		R = WHITE;
		G = WHITE;
		B = WHITE;
		visible = 0;
		end
		
	endcase
	
//	//if background
//	if (curr_color == 0)
//		begin
//		visible = 0;
//		end
//	else
//		begin
//		R = BLACK;
//		G = BLACK;
//		B = BLACK;
//		visible = 1;
//		end
	
//	end
//else
//	begin
//	curr_color = 0;
//	visible = 0;
//end




endmodule
