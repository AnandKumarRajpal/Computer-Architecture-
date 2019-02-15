module Instruction_Memory
(
	input [63:0] Inst_Addr,
	output reg[31:0] Instruction
);

reg [7:0] register [15:0] ;
	initial
	begin
	register[0] = 8'b10000011;
	register[1] = 8'b00110100;
	register[2] = 8'b00000101;
	register[3] = 8'b00001111;
	register[4] = 8'b10110011;
	register[5] = 8'b10000100;
	register[6] = 8'b10011010;
	register[7] = 8'b00000000;
	register[8] = 8'b10010011;
	register[9] = 8'b10000100;
	register[10] = 8'b00010100;
	register[11] = 8'b00000000;
	register[12] = 8'b00100011;
	register[13] = 8'b00111000;
	register[14] = 8'b10010101;
	register[15] = 8'b00001110;
	end
	
	always@(*)
	Instruction = {register[Inst_Addr+3],register[Inst_Addr+2],register[Inst_Addr+1],register[Inst_Addr]};
	
endmodule
	