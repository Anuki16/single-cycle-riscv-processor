`include "controls.sv"

module datapath #(
	parameter REG_WIDTH = 32,
	parameter REG_COUNT = 32,
	parameter NUM_MEM_LOCS = 64,
	parameter ALU_SEL_WIDTH = 4
)(
	/* control signals */
	input logic clk, rstn,
	input logic write_en,
	
	input logic [ALU_SEL_WIDTH-1:0] alu_sel,
	input logic alu_a_sel, alu_b_sel,
	
	input logic mem_read, mem_write,
	input logic [1:0] load_store_type,
	input logic load_unsigned,
	
	input logic [1:0] write_src_sel,		// from where is written to register
	
	input logic [2:0] branch_type,
	/* End of control signals */
	
	input logic [31:0] instruction
);

	localparam REG_BITS = $clog2(REG_COUNT);
	logic [REG_BITS-1:0] read_reg1, read_reg2, write_reg;
	logic signed [REG_WIDTH-1:0] read_data1, read_data2, write_data, imm_data;
	logic signed [REG_WIDTH-1:0] bus_a, bus_b, alu_out;
	logic alu_zero, alu_neg;
	logic [REG_WIDTH-1:0] mem_addr; 
	logic signed [REG_WIDTH-1:0] mem_write_data, mem_read_data;
	logic [31:0] pc, target_pc, return_pc, pc_offset;
	
	assign read_reg1 = instruction[19:15];
	assign read_reg2 = instruction[24:20];
	assign write_reg = instruction[11:7];
	
	assign bus_a = alu_a_sel? pc : read_data1;		// use PC if 1
	assign bus_b = alu_b_sel? imm_data : read_data2;	// immediate if 1
	
	assign mem_addr = alu_out;		// Calculated mem address
	assign mem_write_data = read_data2;		// rs2 contents (cannot use bus B because it might have immediate)
	
	assign target_pc = alu_out;
	assign pc_offset = imm_data;
	
	regfile #(.WIDTH(REG_WIDTH),
				.REG_COUNT(REG_COUNT)) regfile_obj(.*);
				
	alu #(.WIDTH(REG_WIDTH),
			.ALU_SEL(ALU_SEL_WIDTH)) alu_obj (.*);
			
	immgen immgen_obj (
			.inst(instruction),
			.imm_out(imm_data)
	);
	
	data_memory #(.ADDR_WIDTH(REG_WIDTH),
					  .DATA_WIDTH(REG_WIDTH),
					  .NUM_LOCS(NUM_MEM_LOCS)) datamem_obj (.*);
	
	pccalc pclogic_obj (.*);
	
	mux3 #(.WIDTH(REG_WIDTH)) reg_src_mux (
			.a0(alu_out),
			.a1(mem_read_data),
			.a2(return_pc),
			.sel(write_src_sel),
			.out(write_data)
	);

endmodule