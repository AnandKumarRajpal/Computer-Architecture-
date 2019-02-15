module ALU_1_bit
(
	input a, b, carryIn,
	input [3:0] aluOp,
	output reg result, reg carryOut
);

wire mux1out, mux2out;
wire abar, bbar;

assign abar = ~a;
assign bbar = ~b;
assign mux1out = (aluOp[3])? abar:a;
assign mux2out = (aluOp[2])? bbar:b;

always @(*)
	begin		
		case(aluOp[1:0])
			2'b00: result =  mux1out && mux2out;
			2'b01: result =  mux1out || mux2out;
			2'b10: begin result =   mux1out + mux2out + carryIn;
					carryOut = (mux1out && carryIn) || (mux2out && carryIn) || (mux1out && mux2out); end
		endcase

	end

endmodule