module Forwarding_Unit(
	input [4:0] rs1, rs2, exmemRd, memwbRd,
	input exmemRegwrite, memwbRegwrite, clk,
	output reg [1:0] forwardA, forwardB
);

always @ (posedge clk)
	begin
	forwardA = 2'b00;
	forwardB = 2'b00;
		if (memwbRegwrite)
			begin
				if (rs1 == memwbRd)
					forwardA = 2'b01;
				if (rs2 == memwbRd)
					forwardB = 2'b01;
			end
		if (exmemRegwrite)
			begin
				if (rs1 == exmemRd)
					forwardA = 2'b10;
				if (rs2 == exmemRd)
					forwardB = 2'b10;
			end
	end

endmodule