module imm_gen 
(
	input [31:0] inst,
	output [63:0] imm_data
);

	wire [11:0] load, store, cond;
	reg [11:0] q;
	wire [51:0] ext;
	
	assign ext = {52{inst[31]}};
	
	assign load = inst[31:20];
	assign store = { inst[31:25], inst[11:7] };
	assign cond = { inst[31], inst[7], inst[30:25], inst[11:8] };
	
	always@(inst or q)
	begin
		case (inst[6:5])
			00: q = load;
			01: q = store;
			10: q = cond;
			11: q=cond;
		endcase
	end
	
	
	assign imm_data = { ext, q }; 
	
endmodule
