module tb
(
);
	reg [63:0] Mem_Addr;
	reg [63:0] Write_Data;
	reg clk,MemWrite,MemRead;
	wire [63:0] Read_Data;
	
	
Data_Memory DM
(
	.Mem_Addr(Mem_Addr),
	.Write_Data(Write_Data),
	.clk(clk),
	.MemWrite(MemWrite),
	.MemRead(MemRead),
	.Read_Data(Read_Data)	
);

initial 
	begin
		clk = 1'b1;
		MemWrite = 1'b1;
		MemRead = 1'b1;
		Write_Data = 64'd1220;
		Mem_Addr = 64'd0;
		#50 Mem_Addr = 64'd8;
		#50 Mem_Addr = 64'd24;
	end
	
	always
	#10 clk = ~ clk;
	always
	#10 MemRead = ~ MemRead;
	always
	#10 MemWrite = ~ MemWrite;
	
	
endmodule	

