module alu #(parameter N=32)
				(input  logic [N-1:0] A, B, 
             input  logic [3:0]  Control, 
             output logic [N-1:0] Y) ;
            //  output logic [3:0] AluFlags); //Zero, Overflow, Negative, Carry);

 logic Cout;// Negative, Zero, Carry, Overflow;

logic [N-1:0] sum, B_calc, and_r, or_r,
xor_r, leftShift_r, rightShift_r, arithShift_r;

//~B (inverted) or B, if substracting C[0]=1 or adding C[0]=0 
//also works as not operation
assign B_calc= Control[0] ? ~B : B;
					
					
//modules & operations
adder_n #(N) sumador(A, B_calc, Control[0], sum, Cout);
andGate_n #(N) compAnd(A, B, and_r);
orGate_n #(N) compOR(A,B, or_r);
xorGate_n #(N) compXor(A,B, xor_r);
leftShifter_n #(N) ls(B, A[$clog2(N)-1:0], leftShift_r);
rightShifter_n #(N) rs(B, A[$clog2(N)-1:0], rightShift_r);
arithShifter_n #(N) as(B, A[$clog2(N)-1:0], arithShift_r);
//n_and #(N) zeroAnd(Y,Zero);

//7 sEGMENTOS




//control module
ALUcontrolMux16_n #(32) control(sum, sum, and_r, or_r, ~or_r,xor_r,leftShift_r,rightShift_r,arithShift_r,
									Control, Y);
									


//output flags
// assign Zero = &(~Y);
// assign Negative = Y[N-1];
// assign Overflow = (~Control[1]) & (A[N-1] ^ sum[N-1]) & ~(A[N-1] ^ B[N-1] ^ Control[0]);
// assign Carry = (~Control[1]) & Cout;
//
//assign AluFlags[] = &(~Y);
//assign AluFlags[] = Y[N-1];
//assign AluFlags[]= (~Control[1]) & (A[N-1] ^ sum[N-1]) & ~(A[N-1] ^ B[N-1] ^ Control[0]);
//assign AluFlags[]= (~Control[1]) & Cout;

// assign AluFlags = {Negative, Zero, Carry, Overflow};
				 
endmodule