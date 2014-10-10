//This program uses two D-latchss that use SW[0] as the D input, and SW[1] as the clock. 
//The latches are in a master-slave setup
//LEDR[1] is the output of the master latch, LEDR[0] is the output of the slave latch
module Lab33(SW, LEDR);

input [1:0] SW;
output [1:0] LEDR;

D_latch master(SW[0], ~SW[1], LEDR[1]);
D_latch slave(LEDR[1], SW[1], LEDR[0]);

endmodule

/* // This is commented out as it has been declared in Lab32.v, and Quartus will not allow it to be
   // declared here again while being in the same project.
module D_latch (D, Clk, Q);
input D, Clk;
output reg Q;
always @ (D, Clk)
if (Clk)
Q = D;
endmodule*/