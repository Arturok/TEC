module backgroundSprite #(parameter BASECLOUD1_XPOS = 10'd10,
											BASECLOUD1_YPOS = 10'd10,
											BASECLOUD2_XPOS = 10'd100,
											BASECLOUD2_YPOS = 10'd100,
											BASECLOUD3_XPOS = 10'd500,
											BASECLOUD3_YPOS = 10'd80,
											HORIZON_X = 10'd0,
											HORIZON_Y = 10'd300,
											BLACK = 8'hff,
											WHITE = 8'h00)
						(input logic [9:0] x_pos, y_pos,
							input logic [31:0] currY,
							output logic [7:0] R, G, B);

//define the inner indices for the sprite							
logic [9:0] inner_x, inner_y;

//iterator for the sprite
logic curr_color;


always_comb
//if on cloud one section
if (x_pos >= BASECLOUD1_XPOS & x_pos <= BASECLOUD1_XPOS+10'd30
	& y_pos >= BASECLOUD1_YPOS & y_pos <= BASECLOUD1_YPOS+10'd30 )
	begin
	inner_x = x_pos - BASECLOUD1_XPOS;
	inner_y = y_pos - BASECLOUD1_YPOS;
	end
//if on cloud two section
else if (x_pos >= BASECLOUD2_XPOS & x_pos <= BASECLOUD2_XPOS+10'd30
	& y_pos >= BASECLOUD2_YPOS & y_pos <= BASECLOUD2_YPOS+10'd30 )
	begin
	inner_x = x_pos - BASECLOUD2_XPOS;
	inner_y = y_pos - BASECLOUD2_YPOS;
	end
	
else 
begin
	inner_x = 0;
	inner_y = 0;
end
	
assign curr_color = cloud [inner_y][inner_x];
	
always_comb
case (curr_color)
	0: begin 
		R = WHITE;
		G = WHITE;
		B = WHITE;
		end
	1: begin
		R = BLACK;
		G = BLACK;
		B = BLACK;
		 end
	default: begin 
		R = WHITE;
		G = WHITE;
		B = WHITE;
		end
		
	endcase
//	end
//	
////if on cloud two section
//else if (x_pos >= BASECLOUD2_XPOS & x_pos <= BASECLOUD2_XPOS+10'd30
//	& y_pos >= BASECLOUD2_YPOS & y_pos <= BASECLOUD2_YPOS+10'd30 )
//	begin
//	inner_x = x_pos - BASECLOUD2_XPOS;
//	inner_y = y_pos - BASECLOUD2_YPOS;
//	
//	curr_color = cloud[inner_y][inner_x];
//	
//	case (curr_color)
//	0: begin 
//		R = WHITE;
//		G = WHITE;
//		B = WHITE;
//		end
//	1: begin
//		R = BLACK;
//		G = BLACK;
//		B = BLACK;
//		 end
//	default: begin 
//		R = WHITE;
//		G = WHITE;
//		B = WHITE;
//		end
//		
//	endcase
//	end
	
//if horizon: draw a horizontal black line 3 pixels tall
always_comb
if (x_pos >= HORIZON_X & x_pos <= 10'd643
	& y_pos >= HORIZON_Y & y_pos <= HORIZON_Y+10'd3 )
	begin
		R = BLACK;
		G = BLACK;
		B = BLACK;
	end
	
else
begin 
	R = WHITE;
	G = WHITE;
	B = WHITE;
end
	
	



//assign inner_x= x_pos - BASE_XPOS;
//assign inner_y= y_pos - BASE_YPOS;


//initialize 16x7 2d array containing the sprite				
logic cloud [0:29][0:29]=
'{'{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0}, 
'{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0}, 
'{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0}, 
'{0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0}, 
'{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1}, 
'{0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1}, 
'{1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
'{1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
'{1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
'{1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
'{1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
'{1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
'{1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
'{1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1}, 
'{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
'{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
'{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
'{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
'{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};

//always_comb 
//begin

//if (inner_x >= 0 & inner_x <= 6 & inner_y <= 0 & inner_y <= 15 )
//	begin
//	curr_color = bichito[inner_y][inner_x];
//	
//	case (curr_color)
//	0: visible = 0;
//	1: begin R = BLACK;
//		G = BLACK;
//		B = BLACK;
//		visible = 1; end
//	default: visible =0;
//		
//	endcase
	
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
