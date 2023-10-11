`include "controls.sv"

module controller (
	input logic [31:0] instruction,
	output logic [25:0] ctrl
);
	// Control store
	localparam W_I = 9;	// size of memory address
	localparam W_C = 26;	// size of microinstruction
	
	logic [2**W_I-1:0][W_C-1:0] control_store;
	
	logic [8:0] ctrl_addr;
	logic [6:0] opcode;
	logic [2:0] func3;
	
	assign opcode = instruction[6:0];
	assign func3 = instruction[14:12];
	
	assign ctrl_addr[8:4] = instruction[6:2];
	
	always_comb begin
		if (opcode == `TYPE_R ||	
			(opcode == `TYPE_I_COMP && func3 == 3'b101))
			ctrl_addr[0] = instruction[30];
		else
			ctrl_addr[0] = 1'b0;
			
		if (opcode == `TYPE_R ||
			 opcode == `TYPE_I_COMP ||
			 opcode == `TYPE_I_LOAD ||
		    opcode == `TYPE_I_JALR ||
			 opcode == `TYPE_S ||
			 opcode == `TYPE_SB )
			ctrl_addr[3:1] = func3;
		else
			ctrl_addr[3:1] = 3'b0;
	end
	
	assign ctrl = control_store[ctrl_addr];
	
	/* microinstructions */
	// format: WEN	ALUSEL ALUB	ALUA	MEMW	MEMR	LST LU WSEL	BT	NEXT			
	
	
endmodule
