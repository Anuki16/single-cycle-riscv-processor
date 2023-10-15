
module inst_memory #(parameter NUM_INST = 128)
(
	input logic [31:0] pc,
	output logic [31:0] instruction
);

	logic [3:0][7:0] memory [0:NUM_INST-1];
	
	// Since PC is byte addressed, we must ignore last 2 bits when indexing
	assign instruction = memory[pc >> 2];
	
	/* Program to be executed */
	assign memory[0] = 32'b00000000010000000000001010010011;
	assign memory[1] = 32'b01000101011001111000001100110111;
	assign memory[2] = 32'b00010010001100110000001100010011;
	assign memory[3] = 32'b00000000011000101010000000100011;
	assign memory[4] = 32'b00000000011000101010001000100011;
	assign memory[5] = 32'b00000000011000101010010000100011;
	assign memory[6] = 32'b00000011110000000000001110010011;
	assign memory[7] = 32'b0001010_00111_00101_000_01010_0001011;	// memcopy: x5 x7 x10 10
	assign memory[8] = 32'b00000000110000101000001010010011;
	
	always_comb begin
		for (int i = 9; i < NUM_INST; i++) memory[i] = 32'b0;
	end
	
endmodule

