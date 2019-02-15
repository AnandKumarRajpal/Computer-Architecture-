module tb
(

);

	reg [31:0] inst;
	wire [63:0] q;
	
	imm_gen ig
	(
		.inst(inst),
		.imm_data(q)
	);
	
	initial
	begin
	inst = 32'b11011010010011001101100010011010;
	#100 inst = 32'b11011010010011001101100010111010;
	#100 inst = 32'b11011010010011001101100011111010;
	#100 inst = 32'b01011010010011001101100011011010;
	end
	
endmodule
