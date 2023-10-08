`include "controls.sv"

module data_memory #(
	parameter ADDR_WIDTH = 32,
	parameter DATA_WIDTH = 32,
	parameter NUM_LOCS = 64	// Number of 32 bit words
)(
	input logic [ADDR_WIDTH-1:0] address,
	input logic signed [DATA_WIDTH-1:0] write_data,
	input logic clk, rstn,
	input logic mem_read, mem_write,	// control signals
	input logic [1:0] load_store_type, 
	input logic load_unsigned,
	output logic signed [DATA_WIDTH-1:0] read_data
);
	
	// Memory: NUM_LOCS locations with 4 bytes each
	logic [3:0][7:0] memory [NUM_LOCS-1:0];
	logic [1:0] byte_num;
	
	always_comb begin 	// mem read
		if (mem_read) begin
			read_data[7:0] = memory[address >> 2][address & 'b11];
		
			case (load_store_type) 
				`LS_BYTE: begin
					if (load_unsigned) read_data[DATA_WIDTH-1:8] = {(DATA_WIDTH-8){1'b0}};
					else read_data[DATA_WIDTH-1:8] = {(DATA_WIDTH-8){read_data[7]}};
				end
				`LS_HALF: begin
					read_data[15:8] = memory[(address+1) >> 2][(address+1) & 'b11];
					if (load_unsigned) read_data[DATA_WIDTH-1:16] = {(DATA_WIDTH-16){1'b0}};
					else read_data[DATA_WIDTH-1:16] = {(DATA_WIDTH-16){read_data[15]}};
				end
				`LS_WORD: begin
					read_data[15:8] = memory[(address+1) >> 2][(address+1) & 'b11];
					read_data[23:16] = memory[(address+2) >> 2][(address+2) & 'b11];
					read_data[31:24] = memory[(address+3) >> 2][(address+3) & 'b11];
				end
				default: read_data = 'b0;
			endcase
				
		end else read_data = 'b0;
	end
	
	always @(posedge clk or negedge rstn) begin	
		if (!rstn) begin
			for (int i = 0; i < NUM_LOCS; i = i+1) memory[i] <= 32'b0;
		end else if (mem_write) begin
			for (int b = 0; b <= load_store_type; b = b+1) begin
				memory[(address+b) >> 2][(address+b) & 'b11] = write_data[8*b+:8];
			end
		end 
	end
	

endmodule