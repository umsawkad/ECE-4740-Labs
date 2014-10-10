//This program implements a full adder with ripple carry using the code given in the lab manual.
// LEDG4 is the final carry out of the ripple carry adder
// LEDG[3:0] is the result of the adder
// SW[8] is the carry in into the adder
// SW[7:4] is the number to add to SW[3:0]
module Lab23 (SW, LEDG, LEDR);
input [17:0] SW;
output [8:0] LEDR, LEDG;

assign LEDR[8:0] = SW[8:0];

wire c1, c2, c3;

fulladder A0 (SW[0], SW[4], SW[8], LEDG[0], c1);
fulladder A1 (SW[1], SW[5], c1, LEDG[1], c2);
fulladder A2 (SW[2], SW[6], c2, LEDG[2], c3);
fulladder A3 (SW[3], SW[7], c3, LEDG[3], LEDG[4]);
endmodule

module fulladder (a, b, ci, s, co); //a: bit0, b: bit1, ci: carry/bit2, s: sum, co: carry out
	input a, b, ci;
	output co, s;

	wire d;

	assign d = a ^ b;
	assign s = d ^ ci;
	assign co = (b & ~d) | (d & ci);
endmodule