//This program uses verilog code to implement shift registers to imitate the fsm to detect four consecutive 0's or 1 consecutive 1's.
//SW[0] is an active low synchronous reset
//SW[1] is the input to the FSM emulator
//KEY[0] is the clock
module Lab73 (SW, LEDR, LEDG, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
input [3:0]KEY;

reg [3:0] zeros, ones; // zeros represents current state, ones represents next state
reg [0:0] reset_state;

always @(!SW[0])
begin: state_table
	if (!SW[0]) begin
		reset_state = 1;
	end
	else begin
		reset_state = 0;
	end
end // state_table

always @(posedge KEY[0])
begin: state_FFS
	if (reset_state) begin
		zeros = 4'b0000;
		ones = 4'b0000;
	end
	else begin
		if (SW[1]) begin
			zeros = 4'b0000;
			ones = ones << 1;
			ones[0] = 1;
		end
		if (!SW[1]) begin
			ones = 4'b0000;
			zeros = zeros << 1;
			zeros[0] = 1;
		end
	end
end // state_FFS

assign LEDG[0] = (zeros == 4'b1111 || ones == 4'b1111)?1:
				   0;
assign LEDR[0] = (zeros[0] == 1 || ones[0] == 1)?1:
				   0;
assign LEDR[1] = (zeros[1] == 1 || ones[1] == 1)?1:
				   0;
assign LEDR[2] = (zeros[2] == 1 || ones[2] == 1)?1:
				   0;
assign LEDR[3] = (zeros[3] == 1 || ones[3] == 1)?1:
				   0;
endmodule
