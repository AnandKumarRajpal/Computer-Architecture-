module mux2(
	input [63:0] a, b, c,
	input [1:0] sel,
	output reg [63:0] d
);

always @ (sel or a or b or c)
		begin
			case(sel)
				2'b00: d = a;
				2'b01: d = b;
				2'b10: d = c;
			endcase
		end

endmodule