
module riscv_single_cycle_processor #(
	parameter REG_WIDTH = 32,
	parameter REG_COUNT = 32,
	parameter NUM_MEM_LOCS = 64,
	parameter NUM_INST = 128,
	parameter ALU_SEL_WIDTH = 4,
	parameter CTRL_SIZE = 21
)( 
	input logic clk, rstn
);	
	logic [31:0] instruction;
	logic [CTRL_SIZE-1:0] ctrl_signals;
	logic ex_no_stay;
	
	controller #(.CTRL_SIZE(CTRL_SIZE)) ctrl_obj (.*);
	
	datapath_mem #(.REG_WIDTH(REG_WIDTH), 
				  .REG_COUNT(REG_COUNT),
				  .NUM_MEM_LOCS(NUM_MEM_LOCS),
				  .NUM_INST(NUM_INST),
				  .ALU_SEL_WIDTH(ALU_SEL_WIDTH),
				  .CTRL_SIZE(CTRL_SIZE)) data_obj (.*);
				  
endmodule
