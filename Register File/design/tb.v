module tb
(
);

	reg clk, reset, Reg_Write;
	reg [4:0] rs1,rs2,rd;
	reg [63:0] Write_Data;
	wire [63:0] Read_Data1, Read_Data2;

	registerFile regFile
	(
		.clk(clk),
		.reset(reset),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.Reg_Write(Reg_Write),
		.Write_Data(Write_Data),
		.Read_Data1(Read_Data1),
		.Read_Data2(Read_Data2)
	);

	initial
	begin
		reset = 1'b1;
		clk  = 1'b1;		
		Reg_Write = 1'b0;
		rs1 = 5'b 00011;
		rs2 = 5'b 01001;
		#100 Reg_Write = 1'b 0;
		#100 reset = ~ reset;
		Write_Data = 64'd9;
		rd = 5'b01100;
		#50 rs1 = rd;
		

	end
	
	always
	#10 clk = ~ clk;
	

	initial
	begin
		$monitor ("Test output value = %b", Read_Data1);
		$monitor ("Test output value = %b", Read_Data2);
	end
	
endmodule