module tb
(

);
	reg [31:0] inst;
	wire [63:0] ReadData1, ReadData2;
	
	top t1
	(
		.instruction(inst),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
	);
	
	initial inst <= 32'b11110000111100001111000011110000;
	
endmodule