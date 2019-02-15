module tb
(
	
);
	reg clk;
	reg reset;

	RISC_V_Processor rp
	(
		.clk(clk),
		.reset(reset)
	);
	
	//initial
	//begin
	//	clk = 1'd0;
	//	reset = 1'd0;
	//	#100 reset = ~ reset;
	//end
initial
	begin
		clk = 1'b0;
		reset = 1'b1;
		
		#10 reset = 1'b0;
	end
	
always
	#10 clk = ~ clk;
	
	endmodule