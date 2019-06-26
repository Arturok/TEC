module vmem(input logic wrClk, rdClk, reset, we, re,
				input logic [17:0] pxlAddr,
				input logic [31:0] wrAddr, wrData,
				output logic [31:0] videoData,
				output logic [7:0] R, G, B);
				
//logic [31:0] VRAM [0:253999];
logic [31:0] VRAM [262143:0];

logic [31:0] pixel;

// assign pixel = VRAM[pxlAddr];

// assign videoData = VRAM[wrAddr];


assign R = pixel [31:24]; 
assign G = pixel [23:16];
assign B = pixel [15:8];

// // integer i;
// always_ff @(posedge wrClk)
// begin
// 	if (reset) begin		
// 	end 
// 	else videoData <= VRAM[wrAddr];
// end


always_ff @(negedge wrClk)
begin
	if (reset) begin
		
	end 
	else if (we) 
		VRAM[wrAddr] <= wrData;	
	videoData = VRAM[wrAddr];
end

always_ff @(posedge rdClk)
begin
	if (reset) pixel = '0;
	else if (re) begin
		pixel = VRAM[pxlAddr];
	end 
	
end	
				
endmodule
