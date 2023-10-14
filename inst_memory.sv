
module inst_memory #(parameter NUM_INST = 128)
(
	input logic [31:0] pc,
	output logic [31:0] instruction
);

	logic [3:0][7:0] memory [0:NUM_INST-1];
	
	// Since PC is byte addressed, we must ignore last 2 bits when indexing
	assign instruction = memory[pc >> 2];
	
	/* Program to be executed */
	assign memory[0] = 32'b00000111101100000000001010010011;
	assign memory[1] = 32'b00011100100000000000001100010011;
	assign memory[2] = 32'b00000000011000101000001110110011;
	
	always_comb begin
		for (int i = 3; i < NUM_INST; i++) memory[i] = 32'b0;
	end
	
endmodule

