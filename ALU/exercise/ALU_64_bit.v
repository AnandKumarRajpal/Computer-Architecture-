module ALU_64_bit
(
	input [63:0] a,
	input [63:0] b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg Zero
);

	wire abar;
	wire bbar;
	wire mux1out;
	wire mux2out;

	assign abar = ~a;
	assign bbar = ~b;
	assign mux1out = (ALUOp[3])? abar:a;
	assign mux2out = (ALUOp[2])? bbar:b;
	
	
	always @(*)
	begin
		case (ALUOp[1:0])
			2'b00:Result = mux1out & mux2out;
			2'b01:Result = mux1out || mux2out;
			2'b10:
			begin
				Result = mux1out + mux2out;
			end
		 endcase
	if (Result == 64'd0)
		Zero = 1'b1;
	else
		Zero = 1'b0;
	end
	
	
	
endmodule 