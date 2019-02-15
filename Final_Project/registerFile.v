module registerFile
(

	input clk, reset,
	input [63:0] WriteData,
	input [4:0] RS1, RS2, RD,
	input RegWrite,
	output reg [63:0] ReadData1, ReadData2

);

reg [63:0] Array [31:0];

integer i;

initial
begin
for (i=0; i<32; i=i+1) Array[i] <= i;
end

always @ (*)
	begin
		if (reset == 1)				// Reset
			begin
				for (i=0; i<32; i=i+1) Array[i] <= i;
				ReadData1 <= Array[RS1];
				ReadData2 <= Array[RS2]; 
			end
		else if (RegWrite == 0)	// Read data
			begin 
				ReadData1 <= Array[RS1];
				ReadData2 <= Array[RS2];
			end
		else if (RegWrite == 1)	// Write data
			begin
				ReadData1 <= Array[RS1];
				ReadData2 <= Array[RS2];
				Array[RD] <= WriteData;
			end
	end


endmodule