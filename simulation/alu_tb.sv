`include "../controls.sv"

`timescale 1ns/1ps

module alu_tb();
	
	logic [3:0] alu_sel;
	logic signed [31:0] bus_a, bus_b, alu_out;
	logic alu_zero, alu_neg;
	
	alu dut(.*);
	
	initial begin
		repeat(10) begin
			bus_a <= $urandom_range(0, 1000);
			bus_b <= $urandom_range(0, 10);
			
			for (int i = 0; i < `ALU_A; i++) begin
				alu_sel <= i;
				
				#10
				case (alu_sel) 
					`ALU_ADD: assert (alu_out == bus_a + bus_b) else $error("ADD: %d %d %d", alu_out, bus_a, bus_b); 
					`ALU_SUB: assert (alu_out == bus_a - bus_b) else $error("SUB: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_SLL: assert (alu_out == (bus_a << bus_b)) else $error("SLL: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_SRL: assert (alu_out == (bus_a >> bus_b)) else $error("SRL: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_SRA: assert (alu_out == (bus_a >>> bus_b)) else $error("SRA: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_AND: assert (alu_out == (bus_a & bus_b)) else $error("AND: %d %d %d", alu_out, bus_a&bus_b, bus_b);
					`ALU_OR: assert (alu_out == (bus_a | bus_b)) else $error("OR: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_XOR: assert (alu_out == (bus_a ^ bus_b)) else $error("XOR: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_SLT: assert (alu_out == (bus_a < bus_b)) else $error("SLT: %d %d %d", alu_out, bus_a, bus_b);
					`ALU_SLTU: assert (alu_out == $unsigned(bus_a) < $unsigned(bus_b)) else $error("SLTU: %d %d %d", alu_out, bus_a, bus_b);
				endcase
			end
		end
	end
endmodule