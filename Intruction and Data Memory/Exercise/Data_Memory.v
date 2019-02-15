module Data_Memory
(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input clk,MemWrite,MemRead,
	output reg[63:0] Read_Data
);

reg [7:0] register [63:0] ;
	initial
	begin
	register[0] = 64'd0;
	register[1] = 64'd1;
	register[2] = 64'd2;
	register[3] = 64'd3;
	register[4] = 64'd4;
	register[5] = 64'd5;
	register[6] = 64'd6;
	register[7] = 64'd7;
	register[8] = 64'd8;
	register[9] = 64'd9;
	register[10] = 64'd10;
	register[11] = 64'd11;
	register[12] = 64'd12;
	register[13] = 64'd13;
	register[14] = 64'd14;
	register[15] = 64'd15;
	register[16] = 64'd16;
	register[17] = 64'd17;
	register[18] = 64'd18;
	register[19] = 64'd19;
	register[20] = 64'd20;
	register[21] = 64'd21;
	register[22] = 64'd22;
	register[23] = 64'd23;
	register[24] = 64'd24;
	register[25] = 64'd25;
	register[26] = 64'd26;
	register[27] = 64'd27;
	register[28] = 64'd28;
	register[29] = 64'd29;
	register[30] = 64'd30;
	register[31] = 64'd31;
	register[32] = 64'd32;
	register[33] = 64'd33;
	register[34] = 64'd34;
		register[35] = 64'd35;
	register[36] = 64'd36;
	register[37] = 64'd37;
	register[38] = 64'd38;
	register[39] = 64'd39;
		register[40] = 64'd40;
	register[41] = 64'd41;
	register[42] = 64'd42;
	register[43] = 64'd43;
	register[44] = 64'd44;
		register[45] = 64'd45;
	register[46] = 64'd46;
	register[47] = 64'd47;
	register[48] = 64'd48;
	register[49] = 64'd49;
		register[50] = 64'd50;
	register[51] = 64'd51;
	register[52] = 64'd52;
	register[53] = 64'd53;
	register[54] = 64'd54;
		register[55] = 64'd55;
	register[56] = 64'd56;
	register[57] = 64'd57;
	register[58] = 64'd58;
	register[59] = 64'd59;
		register[60] = 64'd60;
	register[61] = 64'd61;
	register[62] = 64'd62;
	register[63] = 64'd63;
	end
	
	always@(posedge clk)
	case(MemWrite)
	1'b1: begin
			register[Mem_Addr] = Write_Data[7:0];
			register[Mem_Addr+1] = Write_Data[15:8];
			register[Mem_Addr+2] = Write_Data[23:16];
			register[Mem_Addr+3] = Write_Data[31:24];
			register[Mem_Addr+4] = Write_Data[39:32];
			register[Mem_Addr+5] = Write_Data[47:40];
			register[Mem_Addr+6] = Write_Data[55:48];
			register[Mem_Addr+7] = Write_Data[63:56];
			end
	endcase
	always@(*)
	case(MemRead)
	1'b1:Read_Data = {register[Mem_Addr+7],register[Mem_Addr+6],register[Mem_Addr+5],register[Mem_Addr+4],register[Mem_Addr+3],register[Mem_Addr+2],register[Mem_Addr+1],register[Mem_Addr]};
	
	endcase
	
endmodule

	
	
		