module Program_Counter
(
	input clk, reset,
	input [63:0] PC_In,
	output reg [63:0] PC_Out
);

	always @ (posedge clk)
	begin
		if (reset <= 0) 
			PC_Out <= PC_In;
		else
			PC_Out <=64'd0;
	end
	
	always @ (reset==1)
	begin
		PC_Out <= 64'd0;
	end
	
endmodule
