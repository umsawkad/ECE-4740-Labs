//This program is a D-latch that uses SW[0] as the D input, and SW[1] as the clock. 
//LEDR is the output of the latch
module Lab32(SW, LEDR);

input [1:0] SW;
output [0:0] LEDR;

D_latch latch(SW[0], SW[1], LEDR[0]);

endmodule

module D_latch (D, Clk, Q);
input D, Clk;
output reg Q;
always @ (D, Clk)
if (Clk)
Q = D;
endmodule
