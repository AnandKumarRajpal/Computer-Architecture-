module instruction

(
input [31:0] instruction,
output reg [6:0] opcode, funct7,
output reg [4:0] rd,rs1,rs2,
output reg [2:0] funct3
);

	always @(instruction)
		begin
		assign funct7 = instruction[31:25];
		assign rs2= instruction[24:20];
		assign rs1=  instruction[19:15];
		assign funct3= instruction[14:12];
		assign rd= instruction[11:7];
		assign opcode= instruction[6:0];

	end

endmodule