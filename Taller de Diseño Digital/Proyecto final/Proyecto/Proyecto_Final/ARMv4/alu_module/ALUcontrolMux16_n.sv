module ALUcontrolMux16_n #(parameter N=8)
				(input  logic [N-1:0] sum, substr, and_op, not_op, or_op, 
					xor_op, leftShift_op, rightShift_op, arithShift_op,	
             input  logic [3:0]  selector, 
             output logic [N-1:0] Y);
				 
always_comb
	case(selector)
		//
		0:		Y = sum;
		1:		Y = substr;
		2:		Y = and_op;
		3:		Y = or_op;//not_op;
		4:		Y = or_op;
		5:		Y = xor_op;
		6:		Y = leftShift_op;
		7:		Y = rightShift_op;
		8:		Y = arithShift_op;
		default: Y= '0;
	endcase
	
endmodule
