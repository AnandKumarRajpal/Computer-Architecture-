module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);

reg [7:0] inst_memory [15:0];
initial
begin

// inst_memory[0] = 8'b10000011;
// inst_memory[1] = 8'b00110100;
// inst_memory[2] = 8'b10000101;
// inst_memory[3] = 8'b00000010;
// inst_memory[4] = 8'b10110011;
// inst_memory[5] = 8'b10000100;
// inst_memory[6] = 8'b10011010;
// inst_memory[7] = 8'b00000000;
// inst_memory[8] = 8'b10010011;
// inst_memory[9] = 8'b10000100;
// inst_memory[10] = 8'b00010100;
// inst_memory[11] = 8'b00000000;
// inst_memory[12] = 8'b00100011;
// inst_memory[13] = 8'b00110100;
// inst_memory[14] = 8'b10010101;
// inst_memory[15] = 8'b00000010;

inst_memory[0] <= 8'hb3;
inst_memory[1] <= 8'h02;
inst_memory[2] <= 8'h73;
inst_memory[3] <= 8'h00;
inst_memory[4] <= 8'h33;
inst_memory[5] <= 8'h84;
inst_memory[6] <= 8'h62;
inst_memory[7] <= 8'h00;
inst_memory[8] <= 8'h33;
inst_memory[9] <= 8'h03;
inst_memory[10] <= 8'h73;
inst_memory[11] <= 8'h00;
inst_memory[12] <= 8'hb3;
inst_memory[13] <= 8'h03;
inst_memory[14] <= 8'h54;
inst_memory[15] <= 8'h00;
end

always @(*)
	begin
		// ORIGINAL 
		//Instruction = {inst_memory[Inst_Address + 3], inst_memory[Inst_Address + 2], inst_memory[Inst_Address + 1], inst_memory[Inst_Address]};
		// MODIFICATION to wrap
		Instruction = {inst_memory[Inst_Address[3:0] + 3], inst_memory[Inst_Address[3:0] + 2], inst_memory[Inst_Address[3:0] + 1], inst_memory[Inst_Address[3:0]]};
		// Finally
		//Instruction = {inst_memory[Inst_Address + 0], inst_memory[Inst_Address + 1], inst_memory[Inst_Address + 2], inst_memory[Inst_Address + 3]};
	end

endmodule