module top_control
(
	input [6:0] Opcode,
	input [3:0] Funct,
	output Branch,MemRead,MemtoReg,MemWrite,ALUSrc,Regwrite,
	output  [3:0] Operation
);
	wire [1:0]out;
	
	
	Control_Unit control
	(
		.Opcode(Opcode),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.Regwrite(Regwrite),
		.ALUOp(out)
	);
	
	ALU_Control con
	(
		.Funct(Funct),
		.ALUOp(out),
		.Operation(Operation)
	);
endmodule
