
module datapath #(
	parameter REG_WIDTH = 32,
	parameter REG_COUNT = 32,
	parameter ALU_SEL_WIDTH = 4
)(
	// control signals
	input logic clk, rstn,
	input logic write_en,
	input logic [ALU_SEL_WIDTH-1:0] alu_sel,
	input logic alu_src_sel,
	
	input logic [31:0] instruction
);

	localparam REG_BITS = $clog2(REG_COUNT);
	logic [REG_BITS-1:0] read_reg1, read_reg2, write_reg;
	logic signed [REG_WIDTH-1:0] read_data1, read_data2, write_data, imm_data;
	logic signed [REG_WIDTH-1:0] bus_a, bus_b, alu_out;
	logic zero, negative;
	
	assign read_reg1 = instruction[19:15];
	assign read_reg2 = instruction[24:20];
	assign write_reg = instruction[11:7];
	
	assign bus_a = read_data1;
	assign bus_b = alu_src_sel? imm_data : read_data2;	// immediate if 1
	assign write_data = alu_out;
	
	regfile #(.WIDTH(REG_WIDTH),
				.REG_COUNT(REG_COUNT)) regfile_obj(.*);
				
	alu #(.WIDTH(REG_WIDTH),
			.ALU_SEL(ALU_SEL_WIDTH)) alu_obj (.*);
			
	immgen immgen_obj (
			.inst(instruction),
			.imm_out(imm_data)
	);
	
	
	


endmodule