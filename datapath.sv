
module datapath #(
	parameter REG_WIDTH = 32,
	parameter REG_COUNT = 32,
	parameter ALU_SEL_WIDTH = 4
)(
	// control signals
	input logic clk, rstn,
	input logic write_en,
	input logic [ALU_SEL_WIDTH-1:0] alu_sel
	
);

endmodule