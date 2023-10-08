`include "../controls.sv"

`timescale 1ns/1ps

module data_memory_tb();
	
	localparam ADDR_WIDTH = 32;
	localparam DATA_WIDTH = 32;
	localparam NUM_LOCS = 10;
	
	logic [ADDR_WIDTH-1:0] address;
	logic signed [DATA_WIDTH-1:0] write_data;
	logic clk = 0, rstn = 0;
	logic mem_read = 0, mem_write = 0;	// control signals
	logic [1:0] load_store_type; 
	logic load_unsigned;
	logic signed [DATA_WIDTH-1:0] read_data;
	
	always #5 clk <= ~clk;
	
	data_memory #(.ADDR_WIDTH(ADDR_WIDTH),
					  .DATA_WIDTH(DATA_WIDTH),
					  .NUM_LOCS(NUM_LOCS)) dut (.*);
	
	initial begin
		@(posedge clk) #1 rstn = 0;
		#10 rstn = 1;
		#1 mem_write = 1;
		write_data = 32'b11110000111100001111000011110000;
		address = (5 << 2)|2;	// 5th loc 2nd byte
		load_store_type = `LS_BYTE;
		load_unsigned = 0;
		
		#10 address = (2 << 2)|2;	
		load_store_type = `LS_HALF;
		
		#10 address = (7 << 2)|1;	
		load_store_type = `LS_WORD;
		
		#10 mem_write = 0;
		mem_read = 1;
		address = (5 << 2)|2;
		load_store_type = `LS_BYTE;
		load_unsigned = 0;		
		#1 assert (read_data == $signed(write_data[7:0])) 
			else $error("%d %d", read_data, write_data[7:0]);
			
		#10 load_unsigned = 1;		
		#1 assert (read_data == $unsigned(write_data[7:0])) 
			else $error("%d %d", read_data, write_data[7:0]);
			
		#10 address = (2 << 2)|2;
		load_store_type = `LS_HALF;
		load_unsigned = 0;		
		#1 assert (read_data == $signed(write_data[15:0])) 
			else $error("%d %d", read_data, write_data[15:0]);
			
		#10 load_unsigned = 1;		
		#1 assert (read_data == $unsigned(write_data[15:0])) 
			else $error("%d %d", read_data, write_data[15:0]);
			
		#10 address = (7 << 2)|1;
		load_store_type = `LS_WORD;
		load_unsigned = 0;		
		#1 assert (read_data == write_data) 
			else $error("%d %d", read_data, write_data);
			
		#10 address = (5 << 2);
		load_store_type = `LS_WORD;
		load_unsigned = 0;		
		#1 assert (read_data == {8'b0, write_data[7:0], 16'b0}) 
			else $error("%d", read_data);
		
	end
	
endmodule
		
		
		