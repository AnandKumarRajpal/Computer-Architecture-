module Control_Unit
(
	input [6:0] Opcode,
	output reg Branch, MemRead, MemtoReg,
	output reg [1:0] ALUOp,
	output reg MemWrite, ALUSrc, RegWrite
);

always @(*)
	begin
	
	case(Opcode)
		
		7'b0_11_00_11 : begin
						ALUSrc = 0;
						MemtoReg = 0;
						RegWrite = 1;
						MemRead = 0;
						MemWrite = 0;
						Branch = 0;
						ALUOp = 2'b10;
						end
		
		7'b0_00_00_11 : begin
						ALUSrc = 1;
						MemtoReg = 1;
						RegWrite = 1;
						MemRead = 1;
						MemWrite = 0;
						Branch = 0;
						ALUOp = 2'b00;
						end
		
		7'b0_10_00_11 : begin
						ALUSrc = 1;
						MemtoReg = 0;
						RegWrite = 0;
						MemRead = 0;
						MemWrite = 1;
						Branch = 0;
						ALUOp = 2'b00;
						end
		
		7'b1_10_00_11 : begin
						ALUSrc = 0;
						MemtoReg = 0;
						RegWrite = 0;
						MemRead = 0;
						MemWrite = 0;
						Branch = 1;
						ALUOp = 2'b01;
						end
						
		//Added support for addi
		7'b0_01_00_11 : begin
						ALUSrc = 1;
						MemtoReg = 0;
						RegWrite = 1;
						MemRead = 0;
						MemWrite = 0;
						Branch = 0;
						ALUOp = 2'b00;
						end
		
		7'b0_00_00_00 : begin
						ALUSrc = 0;
						MemtoReg = 0;
						RegWrite = 0;
						MemRead = 0;
						MemWrite = 0;
						Branch = 0;
						ALUOp = 0;
						end
		
	endcase
	
	end

endmodule