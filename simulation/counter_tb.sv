`timescale 1ns/1ps

module counter_tb();

	localparam WIDTH = 7;
	logic [WIDTH-1:0] counter_N;
	logic clk = 0, rstn = 0, counter_en = 0;
	logic [31:0] counter_out;
	logic counter_done, counter_words;
	
	always #5 clk <= ~clk;
	
	counter #(.WIDTH(WIDTH)) dut (.*);
	
	initial begin
		@(posedge clk) #1 rstn = 0;
		#10 rstn = 1;
		
		#10 counter_N = 14;
		
		repeat(14) begin
			repeat(2) @(posedge clk); 
			#1 counter_en = 1;
			if (counter_done) begin
				#10 counter_N = 0;
				#10 $finish();
			end
			#10 counter_en = 0;
			
		end
		
		#10 counter_N = 0;
	end
	
endmodule