module mux2 #(
	parameter WIDTH = 32
)(
	input logic [WIDTH-1:0] a0, a1,
	input logic sel,
	output logic [WIDTH-1:0] out
);
	assign out = sel? a1 : a0;
	
endmodule
	