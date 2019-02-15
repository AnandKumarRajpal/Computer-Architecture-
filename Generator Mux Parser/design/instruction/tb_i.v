module tb
(
);
reg [31:0] instruction;
wire [6:0] opcode, funct7;
wire [4:0] rd,rs1,rs2;
wire [2:0] funct3;

instruction inst
(
	.instruction(instruction),
	.opcode(opcode),
	.funct7(funct7),
	.funct3(funct3),
	.rd(rd),
	.rs1(rs1),
	.rs2(rs2)
);

initial
begin
instruction = 32'b11111110000011000000111110000111;
end


initial
begin
$monitor("Output= %d",funct7);
$monitor("Output= %d",rs2);
$monitor("Output= %d",rs1);
$monitor("Output= %d",funct3);
$monitor("Output= %d",rd);
$monitor("Output= %d",opcode);
end

endmodule
