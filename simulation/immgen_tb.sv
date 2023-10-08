`include "../controls.sv"

`timescale 1ns/1ps

module immgen_tb();

	logic [31:0] inst;
	logic signed [31:0] imm_out;
	
	
	logic [11:0] number1 = -12'd1241;
	logic [12:0] number2 = -13'd2358;
	logic [31:0] number3 = -32'd21867371;
	logic [20:0] number4 = -20'd831444;
	
	
	immgen dut(.*);
	
	initial begin
		inst = {25'd1238, `TYPE_R};
		#1 assert (imm_out == 0) else $error("R type: %d", imm_out);
		#9
		
		inst = {number1, 13'b0, `TYPE_I_LOAD};
		#1 assert ($signed(imm_out) == number1) else $error("I type: %d", imm_out);
		#9	
		
		inst = {number1[11:5], 13'b0, number1[4:0], `TYPE_S};
		#1 assert ($signed(imm_out) == number1) else $error("S type: %d", imm_out);
		#9	
		
		inst = {number2[12], number2[10:5], 13'b0, number2[4:1], number2[11], `TYPE_SB};
		#1 assert ($signed(imm_out) == number2) else $error("SB type: %d", imm_out);
		#9	
		
		inst = {number3[31:12], 5'b0, `TYPE_U_LUI};
		#1 assert (imm_out[31:12] == number3[31:12]) else $error("U type: %d", imm_out);
		#9	
		
		inst = {number4[20], number4[10:1], number4[11], number4[19:12], 5'b0, `TYPE_UJ};
		#1 assert ($signed(imm_out) == number4) else $error("UJ type: %d", imm_out);
	end
	
endmodule
