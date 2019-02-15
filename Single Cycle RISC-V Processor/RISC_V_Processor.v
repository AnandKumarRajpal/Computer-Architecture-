module RISC_V_Processor
(
	input clk,reset
);
	wire [63:0] PC_In; wire [63:0] PC_Out; wire [63:0] out; wire [63:0] out2;
	wire [31:0]instruction1; wire [31:0] ins_buffer;	
	wire [6:0] opcode; 
	wire [4:0] rd;
	wire [4:0]rs1;
	wire [4:0]rs2;
	wire [63:0] Read_Data1; wire [63:0] Read_Data2; wire [63:0]imm_data; wire [63:0] data_out; wire [63:0] data_out2;
	wire[3:0] operation;
	wire [63:0] result; wire [63:0] Read_Data;
	wire Branch; wire MemRead; wire MemtoReg; wire MemWrite; wire ALUSrc; wire Regwrite; wire Zero;
	wire [1:0]ALUOp;
	wire [2:0]funct3;
	wire [6:0]funct7;
	wire [1:0] forward_A_sel,forward_B_sel;
	wire [63:0] PC_buffer1,forwardA_mux_out, forwardB_mux_out, branchBuffer_out, aluResultBuffer_out, DM_buffer_out, forwardB_out;
	wire [63:0] pc_buffer_out, readData1_buffer_out, readData2_buffer_out, immData_buffer_out;
	wire [4:0] rs1_buffer_out, rs2_buffer_out, rd_buffer_out, rd_buffer_out2, rd_buffer_out3;
	wire [3:0] funct_buffer_out;
	wire [2:0] mBuffer_out, mBuffer_out2;
	wire [1:0] wbBuffer_out, aluOp_out, wbBuffer_out2, wbBuffer_out3;
	wire aluSrc_out, zeroBuffer_out;

	
	Adder adder1
	(
		.a(PC_Out),
		.b(64'd4),
		.out(out)
	);
	
	
	Program_Counter pc
	(
		.PC_In(PC_In),
		.PC_Out(PC_Out),
		.clk(clk),
		.reset(reset)
		
	);
	
	Instruction_Memory im
	(
		.Inst_Addr(PC_Out),
		.Instruction(instruction1)
	);

	IFID buffer1(
	.clk(clk),
	.pc_buffer_in(PC_Out),
	.instruction_buffer_in(instruction1),
	.instruction_buffer_out(ins_buffer),
	.pc_buffer_out(PC_buffer1)
	);
	
	instruction inst 
	(
		.instruction(ins_buffer),
		.opcode(opcode),
		.funct7(funct7),
		.rd(rd),
		.rs1(rs1),
		.rs2(rs2),
		.funct3(funct3)
	);

	imm_gen ig
	(
		.inst(ins_buffer),
		.imm_data(imm_data)
	);

	registerFile rf
	(
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd_buffer_out3),
		.Write_Data(data_out2),
		.clk(clk),
		.reset(reset),
		.Reg_Write(wbBuffer_out3[0]),
		.Read_Data1(Read_Data1),
		.Read_Data2(Read_Data2)
	);
	
	IDEX buffer2(
	.clk(clk),
	.pc_buffer_in(PC_buffer1), 
	
	.readData1_buffer_in(Read_Data1), 
	.readData2_buffer_in(Read_Data2), 
	
	.immData_buffer_in(imm_data),
	
	.rs1_buffer_in(rs1),
	.rs2_buffer_in(rs2),
	.rd_buffer_in(rd),
	
	.funct_buffer_in({ins_buffer[30], ins_buffer[14:12]}),
	.mBuffer_in({Branch, MemWrite, MemRead}),
	.wbBuffer_in({MemtoReg, Regwrite}),
	.aluOp_in(ALUOp),
	.aluSrc_in(ALUSrc),
	
	.pc_buffer_out(pc_buffer_out), 
	
	.readData1_buffer_out(readData1_buffer_out), 
	.readData2_buffer_out(readData2_buffer_out), 
	
	.immData_buffer_out(immData_buffer_out),
	
	.rs1_buffer_out(rs1_buffer_out),
	.rs2_buffer_out(rs2_buffer_out),
	.rd_buffer_out(rd_buffer_out),
	
	.funct_buffer_out(funct_buffer_out),
	.mBuffer_out(mBuffer_out),
	.wbBuffer_out(wbBuffer_out),
	.aluOp_out(aluOp_out),
	.aluSrc_out(aluSrc_out)		
	);

	Adder adder2
	(
		.a(pc_buffer_out),
		.b(immData_buffer_out<<1),
		.out(out2)
	);
	
	mux2 forward_A(
	.sel(forward_A_sel),
	.a(readData1_buffer_out),
	.b(data_out2),
	.c(aluResultBuffer_out),
	.d(forwardA_mux_out)
);

	mux2 forward_B(
	.sel(forward_B_sel),
	.a(readData2_buffer_out),
	.b(data_out2),
	.c(aluResultBuffer_out),
	.d(forwardB_mux_out)
);

	mux ALUSrc_mux
	(
		.a(forwardB_mux_out),
		.b(immData_buffer_out),
		.sel(aluSrc_out),
		.data_out(data_out)
	);	

	
	ALU_Control ac
	(
		.ALUOp(aluOp_out),
		.Funct(funct_buffer_out),
		.Operation(operation)
	);
	
	ALU_64_bit ab
	(
		.a(forwardA_mux_out),
		.b(data_out),
		.ALUOp(operation),
		.Result(result),
		.Zero(Zero)
	);
	
	mux branch_mux
	(
		.a(out),
		.b(branchBuffer_out),
		.sel(mBuffer_out2[2] & zeroBuffer_out),
		.data_out(PC_In)
	);
	
	EXMEM buffer3(
	.clk(clk),
	.zero_in(Zero),
	.branch_in(out2),
	.aluResult_in(result),
	.forwardB_in(forwardB_mux_out),
	.rd_in(rd_buffer_out),
	.mBuffer_in(mBuffer_out),
	.wbBuffer_in(wbBuffer_out),
	
	.zero_out(zeroBuffer_out),
	.branch_out(branchBuffer_out),
	.aluResult_out(aluResultBuffer_out),
	.forwardB_out(forwardB_out),
	.rd_out(rd_buffer_out2),
	.mBuffer_out(mBuffer_out2),
	.wbBuffer_out(wbBuffer_out2)
	);
	
	Data_Memory dm
	
	(
		.Mem_Addr(aluResultBuffer_out),
		.Write_Data(forwardB_out),
		.clk(clk),
		.SIZE(2'b11),
		.MemWrite(mBuffer_out2[1]),
		.MemRead(mBuffer_out2[0]),
		.Read_Data(Read_Data)
	);
	
	Control_Unit cu
	(
		.Opcode(opcode),
		.ALUOp(ALUOp),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.Regwrite(Regwrite)
	);
	
		
	mux mux3
	(
		.a(result),
		.b(DM_buffer_out),
		.sel(wbBuffer_out3[1]),
		.data_out(data_out2)
	);	
	Forwarding_Unit f1(
	.rs1(rs1_buffer_out), 
	.rs2(rs2_buffer_out), 
	.exmemRd(rd_buffer_out2), 
	.memwbRd(rd_buffer_out3),
	.exmemRegwrite(wbBuffer_out2[0]),
	.memwbRegwrite(wbBuffer_out3[0]),
	.clk(clk),
	.forwardA(forward_A_sel), 
	.forwardB(forward_B_sel)
);
	MEMWB buffer4(
	.clk(clk),
	.DM_buffer_in(Read_Data),
	.aluResult_in(aluResultBuffer_out),
	.rd_in(rd_buffer_out2),
	.wbBuffer_in(wbBuffer_out2),
	.DM_buffer_out(DM_buffer_out),
	.aluResult_out(result),
	.rd_out(rd_buffer_out3),
	.wbBuffer_out(wbBuffer_out3)
	);

	
endmodule
	