//This program uses verilog code to implement a fsm to detect four consecutive 0's or 1 consecutive 1's.
//SW[0] is an active low synchronous reset
//SW[1] is the input to the FSM
//KEY[0] is the clock
module Lab72 (SW, LEDR, LEDG, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
input [3:0]KEY;

reg [3:0] y_Q, Y_D; // y_Q represents current state, Y_D represents next state
parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;

always @(SW[1], y_Q, !SW[0])
begin: state_table
	if (!SW[0]) begin
		Y_D = A;
	end
	else begin
		case (y_Q)
			A: if (!SW[1]) Y_D = B;
				else Y_D = F;
			B: if (!SW[1]) Y_D = C;
				else Y_D = F;	
			C: if (!SW[1]) Y_D = D;
				else Y_D = F;	
			D: if (!SW[1]) Y_D = E;
				else Y_D = F;	
			E: if (!SW[1]) Y_D = E;
				else Y_D = F;	
			F: if (!SW[1]) Y_D = B;
				else Y_D = G;
			G: if (!SW[1]) Y_D = B;
				else Y_D = H;
			H: if (!SW[1]) Y_D = B;
				else Y_D = I;
			I: if (!SW[1]) Y_D = B;
				else Y_D = I;
			default: Y_D = 4'bxxxx;
		endcase
	end
end // state_table

always @( posedge KEY[0])
begin: state_FFs
	y_Q = Y_D;
end // state_FFS

assign LEDG[0] = (y_Q == E || y_Q == I)?1:
				   0;
assign LEDR[0] = (y_Q == B || y_Q == F || y_Q == C || y_Q == G || y_Q == D || y_Q == H || y_Q == E || y_Q == I)?1:
				   0;
assign LEDR[1] = (y_Q == C || y_Q == G || y_Q == D || y_Q == H || y_Q == E || y_Q == I)?1:
				   0;
assign LEDR[2] = (y_Q == D || y_Q == H || y_Q == E || y_Q == I)?1:
				   0;
assign LEDR[3] = (y_Q == E || y_Q == I)?1:
				   0;
endmodule
