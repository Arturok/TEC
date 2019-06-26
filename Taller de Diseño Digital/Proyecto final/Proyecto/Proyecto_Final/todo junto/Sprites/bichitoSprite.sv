module bichitoSprite #(parameter BASE_XPOS = 10'd315,
											BASE_YPOS = 10'd240,
											BLACK = 8'hff,
											WHITE = 8'h00,
                                            SPRITE_HSIZE= 10'd8 ,
                                            SPRITE_VSIZE=10'd16)
						(input logic [9:0] x_pos, y_pos,
							input logic [31:0] currY,
							output logic [7:0] R, G, B,
							output logic visible);

//define the inner indices for the sprite							
logic [9:0] inner_x, inner_y;
logic [9:0] bichito_Ypos;
logic pintar;


assign bichito_Ypos = currY [9:0];

assign inner_x = x_pos - BASE_XPOS;
assign inner_y = y_pos - bichito_Ypos;

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

assign pintar= (inner_x >= 0 & inner_x <= SPRITE_HSIZE-1 & inner_y >= 0 & inner_y <= SPRITE_VSIZE-1);

assign curr_color = pintar ? bichito[inner_y][inner_x] : 0;
	
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

endmodule
