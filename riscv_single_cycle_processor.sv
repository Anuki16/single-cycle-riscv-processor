
module riscv_single_cycle_processor #(
	parameter REG_WIDTH = 32,
	parameter REG_COUNT = 32,
	parameter NUM_MEM_LOCS = 64,
	parameter NUM_INST = 128,
	parameter ALU_SEL_WIDTH = 4
)( 
	input logic clk, rstn
);	
	logic [31:0] instruction;
	logic [17:0] ctrl_signals;
	
	controller ctrl_obj (.*);
	
	datapath #(.REG_WIDTH(REG_WIDTH), 
				  .REG_COUNT(REG_COUNT),
				  .NUM_MEM_LOCS(NUM_MEM_LOCS),
				  .NUM_INST(NUM_INST),
				  .ALU_SEL_WIDTH(ALU_SEL_WIDTH)) data_obj (.*);
				  
endmodule
