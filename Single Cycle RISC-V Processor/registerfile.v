module registerFile
(
	
	input reset,clk,
	input [63:0] Write_Data,
	input [4:0] rs1, rs2, rd,
	input Reg_Write,
	output reg [63:0] Read_Data1, Read_Data2

);

reg [63:0] register [31:0];
	always @ (posedge clk or reset)
	begin
		begin
			if (Reg_Write)
				register[rd] = Write_Data;
		end
	end
	always @ (rs1 or rs2 or reset)
		begin
		if (reset)
		begin
			Read_Data1 = 64'd0;
			Read_Data2 = 64'd0;
		end
		else
		begin
			Read_Data1 = register[rs1];
			Read_Data2 = register[rs2];
			end
		end
	initial
	begin
		register[5'b00000] = 64'd0;
		register[5'b00001] = 64'd1;
		register[5'b00010] = 64'd2;
		register[5'b00011] = 64'd3;
		register[5'b00100] = 64'd4;
		register[5'b00101] = 64'd5;
		register[5'b00110] = 64'd6;
		register[5'b00111] = 64'd7;
		register[5'b01000] = 64'd8;
		register[5'b01001] = 64'd9;
		register[5'b01010] = 64'd8;
		register[5'b01011] = 64'd11;
		register[5'b01100] = 64'd12;
		register[5'b01101] = 64'd13;
		register[5'b01110] = 64'd14;
		register[5'b01111] = 64'd15;
		register[5'b10000] = 64'd16;
		register[5'b10001] = 64'd17;
		register[5'b10010] = 64'd18;
		register[5'b10011] = 64'd19;
		register[5'b10100] = 64'd20;
		register[5'b10101] = 64'd21;
		register[5'b10110] = 64'd22;
		register[5'b10111] = 64'd23;
		register[5'b11000] = 64'd24;
		register[5'b11001] = 64'd25;
		register[5'b11010] = 64'd26;
		register[5'b11011] = 64'd27;
		register[5'b11100] = 64'd28;
		register[5'b11101] = 64'd29;
		register[5'b11110] = 64'd30;
		register[5'b11111] = 64'd31;
	end
	
	


endmodule