module top
(
	input [3:0]aluOp,
	input carryIn,
	input [5:0]a, 
	input [5:0]b,
	output [5:0]result,
	output carryOut
);

wire [4:0]carryOutAlu;
//assign carryOutAlu = 5'b00000;

ALU_1_bit alu0
(
	.a(a[0]),
	.b(b[0]),
	.carryIn(carryIn),
	.result(result[0]),
	.carryOut(carryOutAlu[0]),
	.aluOp(aluOp)
);

ALU_1_bit alu1
(
	.a(a[1]),
	.b(b[1]),
	.carryIn(carryOutAlu[0]),
	.result(result[1]),
	.carryOut(carryOutAlu[1]),
	.aluOp(aluOp)
);

ALU_1_bit alu2
(
	.a(a[2]),
	.b(b[2]),
	.carryIn(carryOutAlu[1]),
	.result(result[2]),
	.carryOut(carryOutAlu[2]),
	.aluOp(aluOp)
);

ALU_1_bit alu3
(
	.a(a[3]),
	.b(b[3]),
	.carryIn(carryOutAlu[2]),
	.result(result[3]),
	.carryOut(carryOutAlu[3]),
	.aluOp(aluOp)
);

ALU_1_bit alu4
(
	.a(a[4]),
	.b(b[4]),
	.carryIn(carryOutAlu[3]),
	.result(result[4]),
	.carryOut(carryOutAlu[4]),
	.aluOp(aluOp)
);

ALU_1_bit alu5
(
	.a(a[5]),
	.b(b[5]),
	.carryIn(carryOutAlu[4]),
	.result(result[5]),
	.carryOut(carryOut),
	.aluOp(aluOp)
);




endmodule
