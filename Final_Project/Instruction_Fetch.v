module Instruction_Fetch
(
	input clk, reset,
	output [31:0] Instruction
);

wire [63:0] w_out;
wire [63:0] w_pc_out;

	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(w_out),
		.PC_Out(w_pc_out)
	);

	Adder ADD
	(
		.a(w_pc_out),
		.b(64'd4),
		.out(w_out)
	);
	
	Instruction_Memory IM
	(
		.Inst_Address(w_pc_out),
		.Instruction(Instruction)
	);
	
	
	
	
endmodule