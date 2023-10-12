
module inst_memory #(parameter NUM_INST = 128)
(
	input logic [31:0] pc,
	output logic [31:0] instruction
);

	logic [3:0][7:0] memory [NUM_INST-1:0];
	
	// Since PC is byte addressed, we must ignore last 2 bits when indexing
	assign instruction = memory[pc >> 2];
	
endmodule