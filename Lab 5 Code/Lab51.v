//This program implements a counter that counts to k-1. It displays the count on the red LEDs
//Key0 is asynchronous reset
//SW[1] is the clock
module Lab51 (SW, LEDR, KEY);
input [17:0] SW;
output [17:0] LEDR;
input [3:0] KEY;
integer counter;
wire [17:0] q;

assign LEDR[17:0] = q;

counter2 myCounter(SW[0], KEY[0], q, 5);

endmodule


module counter2(clock, reset_n, Q, k);
parameter n = 8;
input clock, reset_n;
output reg[n-1:0] Q;
input k;
integer count;

reg RESET;

always @ (posedge clock or negedge reset_n)
begin : COUNTER
  if (~reset_n) begin
    Q <= 'd0;
	 count = 0;
  end
  else if (clock && count < (5-1)) begin
	 Q <= Q + 1'b1;
	 count = count + 1;
  end
  else begin
    Q <= 'd0;
	 count = 0;
  end
end

endmodule
