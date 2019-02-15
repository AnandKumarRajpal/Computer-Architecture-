module tb
(
);

	reg [63:0] a;
	reg [63:0] b;
	reg sel;
	wire [63:0] data_out;
	
	mux m1
	(
		.a(a),
		.b(b),
		.sel(sel),
		.data_out(data_out)
	);
	
	initial
	a = 64'd0;
	
	initial
	b = 64'd1;
	
	initial
	sel = 1'b0;
	
	always
	#10 sel = ~sel;
	
	initial
	$monitor("Time = ", $time,  "---> Output = %d", data_out);

endmodule
