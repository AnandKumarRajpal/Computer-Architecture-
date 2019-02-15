module tb
(
);

reg [5:0]a;
reg [5:0]b;
reg carryIn;
wire carryOut;
wire [5:0]result;
reg [3:0]aluOp;


top t1
(
	.a(a),
	.b(b),
	.carryIn(carryIn),
	.carryOut(carryOut),
	.aluOp(aluOp),
	.result(result)
	
);

initial
begin
	a = 6'b001000;
	b = 6'b001111;
	carryIn = 1'b0;
end

initial
begin
	aluOp = 4'b0000;
	#50 aluOp = 4'b0001;
	#50 aluOp = 4'b0010;
	#50 carryIn = 1'b1;
	aluOp = 4'b0110;
	
	#50 aluOp = 4'b1100;
end



endmodule