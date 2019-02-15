module top
(
	input [31:0] instruction,
	output [63:0] ReadData1, ReadData2
);
	reg clk, reset, RegWrite;
	wire [4:0] rd, rs1, rs2;

	instruction ip1
	(
		.inst(instruction),
		.rd(rd),
		.rs1(rs1),
		.rs2(rs2)
	);
	
	registerFile rf1
	(
		.clk(clk),
		.reset(reset),
		.RegWrite(RegWrite),
		.RS1(rs1),
		.RS2(rs2),
		.RD(rd),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
	initial
	begin
		clk <= 1'b1;
		reset <= 1'b0;
		RegWrite <= 1'b0;
	end
	
endmodule
		

