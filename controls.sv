`ifndef CONTROLS_SV_INCLUDED
`define CONTROLS_SV_INCLUDED

// ALU control signals
`define ALU_ADD 'b0000
`define ALU_SUB 'b0001
`define ALU_SLL 'b0010
`define ALU_SRL 'b0011
`define ALU_SRA 'b0100
`define ALU_AND 'b0101
`define ALU_OR  'b0110
`define ALU_XOR 'b0111
`define ALU_SLT 'b1000
`define ALU_SLTU 'b1001
`define ALU_A   'b1010
`define ALU_B   'b1011

// Opcode types
`define TYPE_R 	  7'b0110011
`define TYPE_I_COMP 7'b0010011
`define TYPE_I_LOAD 7'b0000011
`define TYPE_I_JALR 7'b1100111
`define TYPE_S		  7'b0100011
`define TYPE_SB     7'b1100011 
`define TYPE_U_LUI  7'b0110111
`define TYPE_U_AUIPC 7'b0010111
`define TYPE_UJ	  7'b1101111

`endif