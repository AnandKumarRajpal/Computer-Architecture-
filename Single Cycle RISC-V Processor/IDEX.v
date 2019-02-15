module IDEX(
	input clk,
	input [63:0] pc_buffer_in, readData1_buffer_in, readData2_buffer_in, immData_buffer_in,
	input [4:0] rs1_buffer_in, rs2_buffer_in, rd_buffer_in,
	input [3:0] funct_buffer_in,
	input [2:0] mBuffer_in,
	input [1:0] wbBuffer_in, aluOp_in,
	input aluSrc_in,
	output reg [63:0] pc_buffer_out, readData1_buffer_out, readData2_buffer_out, immData_buffer_out,
	output reg [4:0] rs1_buffer_out, rs2_buffer_out, rd_buffer_out,
	output reg [3:0] funct_buffer_out,
	output reg [2:0] mBuffer_out,
	output reg [1:0] wbBuffer_out, aluOp_out,
	output reg aluSrc_out
);

always @(posedge clk)
begin
	 pc_buffer_out = pc_buffer_in;
	 readData1_buffer_out = readData1_buffer_in;
	 readData2_buffer_out = readData2_buffer_in;
	 immData_buffer_out = immData_buffer_in;
	 rs1_buffer_out = rs1_buffer_in;
	 rs2_buffer_out = rs2_buffer_in;
	 rd_buffer_out = rd_buffer_in;
	 funct_buffer_out = funct_buffer_in;
	 mBuffer_out = mBuffer_in;
	 wbBuffer_out = wbBuffer_in;
	 aluOp_out = aluOp_in;
	 aluSrc_out = aluSrc_in;
end

endmodule