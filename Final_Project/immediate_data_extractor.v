module immediate_data_generator
(
	input [31:0] instruction,
	output reg [63:0] imm_data
);

wire [1:0] sel;
reg [11:0] immediate;

assign sel = instruction [6:5];

always@(sel or instruction)
	begin
		case (sel)
			2'b00:
			begin 
				immediate = instruction[31:20]; 
				imm_data = {{52{immediate[11]}},immediate};// load 
			end
			2'b01:
			begin
				immediate = {instruction[31:25],instruction[11:7]};
				imm_data = {{52{immediate[11]}},immediate};// store
			end 
			default:
			begin
				immediate = {instruction[31],instruction[7],instruction[30:25],instruction[11:8]}; 
				imm_data = {{52{immediate[11]}},immediate};// conditional 
			end
		endcase
	end

endmodule 
