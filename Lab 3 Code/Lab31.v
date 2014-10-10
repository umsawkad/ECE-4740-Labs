//This program implements an RS latch. I did not use the code given in the lab manual because every time
//I tried to run a simulation on it, the code would fall into an infinite loop and would create an 
//iteration limit reached error in ModelSim.
//The Lab31Waveform.vwf that goes with this .v file does produce the waveform for this RS latch.
module Lab31 (Clk, R, S, Q, Qbar);
input Clk, R, S;
output Q, Qbar;

Lab31LatchA myLatch(Clk, R, S, Q, Qbar);

endmodule

// A gated RS latch
module Lab31LatchA (Clk, R, S, Q, Qbar);
	input wire R, S, Clk;
	output wire Q, Qbar;

   wire   S2   = ~(Clk & S);
   wire   R2   = ~(Clk & R);
   assign Q    = ~(S2 & Qbar);
   assign Qbar = ~(R2 & Q);
endmodule
