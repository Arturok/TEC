module AddrDecoder(input[31:0] address,
       input logic memWrite,
       output WEn0, WEn1, WEn2, DSel);
       
  logic dataMemory;
  assign dataMemory = address > 32'h0 & address < 32'h0FA0;     


  always_comb
  //if (memWrite) begin
  // WEn0 = 0; WEn1 = 0; WEn2 = 0; DSel = 0;
  // end
  
  //Comunicación con memoria y Write está activo
  if (dataMemory & memWrite) begin
   WEn0 = 1; WEn1 = 0; WEn2 = 0; DSel = 0;
   end
  else begin  
   
   case(address)
   
   32'h0FA0: //Sprite Bichito
      begin
      WEn0 = 0; WEn1 = 1; WEn2 = 0; DSel = 0;
      end
   32'h0FA4: //Sprite Obstáculo
      begin
      WEn0 = 0; WEn1 = 0; WEn2 = 1; DSel = 0;
      end
   32'h0FA8: //PS2
      begin
      WEn0 = 0; WEn1 = 0; WEn2 = 0; DSel = 1;
      end
   default: 
      begin
      WEn0 = 0; WEn1 = 0; WEn2 = 0; DSel = 0;
      end
   endcase
  end
endmodule