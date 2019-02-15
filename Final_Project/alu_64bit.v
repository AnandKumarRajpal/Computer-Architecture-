module alu_64bit
(
	input [63:0] a,b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg Zero
);

always @(*)
	begin
		// And
		if (ALUOp == 4'b0000)
			Result = a & b;
		// Or
		else if (ALUOp == 4'b0001)
			Result = a | b;
		// Add
		else if (ALUOp == 4'b0010)
			Result = a + b;
		// Subtract 
		else if (ALUOp == 4'b0110)
			Result = a - b;
		// NOR
		else if (ALUOp == 4'b1100)
			Result = ~(a | b);
		
		// Manage Zero Output
		if (Result == 0)
			Zero = 1;
		else 
			Zero = 0;
	end




endmodule