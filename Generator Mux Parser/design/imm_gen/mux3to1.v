module mux3to1
(
	input [11:0] load, store, cond,
	input [1:0] sel,
	output reg [11:0] q
);

	always@*
	begin
		if (sel[1])
			q = cond;
		else
			begin
				if (sel[0])
					q = store;
				else
					q = load;
			end
	end
	
endmodule
