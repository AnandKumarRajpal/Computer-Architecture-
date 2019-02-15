module tb
(
	
);

	reg clk;
	reg reset;
	wire [31:0] Instruction;
	
	Instruction_Fetch ifs
	(
		.clk(clk),
		.reset(reset),
		.Instruction(Instruction)
		
	);
	
	initial
	begin
		clk = 1'd0;
		reset = 1'd1;
		#1 reset = ~ reset;
		#170 reset = ~ reset;
	end
		
		
		
	always
	begin
		#20 clk = ~ clk;
		
	end
endmodule