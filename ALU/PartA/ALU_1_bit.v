module ALU_1_bit
(
	input a,
	input b,
	input CarryIn,
	input [3:0] ALUop,
	output reg Result,CarryOut

);

wire Ainvert;
wire Binvert;
wire mux1out;
wire mux2out;

assign Ainvert = ~a;
assign Binvert = ~b;
assign mux1out = (ALUop[3])?Ainvert:a;
assign mux2out = (ALUop[2])?Binvert:b;


always @(*)
	begin
		case(ALUop[1:0])
			2'b00 : Result = mux1out && mux2out;
			2'b01 : Result = mux1out || mux2out;
			2'b10 : begin Result = mux1out + mux2out + CarryIn;
				CarryOut = (mux1out && CarryIn) ||(mux2out && CarryIn) || (mux1out && mux2out);end
		endcase
	end
endmodule
			