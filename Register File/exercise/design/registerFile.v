module registerFile
(
	input [63:0] WriteData,
	input [4:0] RS1, RS2, RD,
	input RegWrite, clk, reset,
	output reg [63:0] ReadData1, ReadData2
);
	
	reg [63:0] RegFile [17:0];
	
	always @(posedge clk or posedge reset)
	begin
		if (reset)
		begin
			ReadData1 <= 64'd0;
			ReadData2 <= 64'd0;
		end
		else
		begin
			if (RegWrite)
				RegFile[RD] <= WriteData;
				
			ReadData1 <= RegFile[RS1];
			ReadData2 <= RegFile[RS2];
		end
	end
	
	initial
	begin
		RegFile[0] <= 64'd0;
		RegFile[1] <= 64'd1;
		RegFile[2] <= 64'd2;
		RegFile[3] <= 64'd3;
		RegFile[4] <= 64'd4;
		RegFile[5] <= 64'd5;
		RegFile[6] <= 64'd6;
		RegFile[7] <= 64'd7;
		RegFile[8] <= 64'd8;
		RegFile[9] <= 64'd9;
		RegFile[10] <= 64'd10;
		RegFile[11] <= 64'd11;
		RegFile[12] <= 64'd12;
		RegFile[13] <= 64'd13;
		RegFile[14] <= 64'd14;
		RegFile[15] <= 64'd15;
		RegFile[16] <= 64'd16;
		RegFile[17] <= 64'd17;
	end
	
endmodule