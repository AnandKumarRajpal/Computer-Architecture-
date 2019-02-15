module tb
(
);
	reg a;
	reg b;
	reg CarryIn;
	reg [3:0]ALUop;
	wire Result;
	wire CarryOut;
	
ALU_1_bit ALU
(
	.a(a),
	.b(b),
	.CarryIn(CarryIn),
	.ALUop(ALUop),
	.Result(Result),
	.CarryOut(CarryOut)

);
	
initial
	
	begin
		a= 1'b1;
		b = 1'b1;
		CarryIn = 1'b0;
	end
	
initial
	begin
		ALUop = 4'b0000;
		#50 ALUop = 4'b0001;
		#50 ALUop = 4'b0010;
		#50 CarryIn = 1'b1;
		ALUop = 4'b0110;
		#50 ALUop = 4'b1100;
	end
endmodule
