module tb
(
);
	reg [63:0] Inst_Addr;
	wire [31:0] Instruction;
	
Instruction_Memory IM
(
	.Inst_Addr(Inst_Addr),
	.Instruction(Instruction)
);

initial 
	begin
		Inst_Addr = 64'd0;
		#50 Inst_Addr = 64'd4;
		#50 Inst_Addr = 64'd8;
		#50 Inst_Addr = 64'd12;
	end
endmodule	
		