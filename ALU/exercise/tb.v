module tb
(
	
);

	reg [63:0] a;
	reg [63:0] b;
	reg [3:0] ALUOp;
	wire [63:0] Result;
	
	wire Zero;
	
	ALU_64_bit alu1
	(
		.a(a),
		.b(b),
		.ALUOp(ALUOp),
		.Result(Result),
		.Zero(Zero)
	);
	
	initial
	begin
		a = 64'd18;
		b = 64'd27;
		
	end
	initial
	begin
		ALUOp = 4'b0000;
		#50 ALUOp = 4'b0001;
		#50 ALUOp = 4'b0010;
		#50 ALUOp = 4'b0110;
		#50 ALUOp = 4'b1100;
	end

endmodule 