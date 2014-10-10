//This program uses a D-latch, positive edge triggered D flip flop, and a negative edge triggered D flip flop
//D is the input 
//LEDR is the output of the latch
//The file Lab34Waveform.vwf does produce the same waveform as in the lab manual.
module Lab34(Qc, Qa, Qb, D, Clk);
input D, Clk;
output reg Qc, Qb;
output Qa;

D_latch latch(D, Clk, Qa); //(input, clock, output)

always @ (posedge Clk) begin // This is the positive edge triggered D flip flop
if (D == 1) begin
	Qb <= 1;
end else begin
	Qb <= 0;
end
end

always @ (negedge Clk) begin // This is the negative edge triggered D flip flop
if (D == 1) begin
	Qc <= 1;
end else begin
	Qc <= 0;
end

end
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