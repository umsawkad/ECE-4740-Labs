//This program uses T flip flops to create an 8 bit counter, and display the count onto HEX[2:0]
//KEY[0] is the clock
//SW[0] is Clear when toggled low
//SW[1] is Enable when toggled high
//Leave SW[1:0] high for the counter to work. 
`define BLANK 7'b1111111
`define ZERO 7'b1000000
`define ONE 7'b1111001
`define TWO 7'b0100100
`define THREE 7'b0110000
`define FOUR 7'b0011001
`define FIVE 7'b0010010
`define SIX 7'b0000010
`define SEVEN 7'b1111000
`define EIGHT 7'b0000000
`define NINE 7'b0010000

module Lab41 (SW, LEDR, LEDG, HEX0, HEX1, HEX2, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
input [3:0]KEY;
integer Count;
wire[7:0]w;

assign LEDR = SW;
assign LEDG = w;

//These are the eight T latches for the eight bit counter
T_Latch Latch1(SW[1], KEY[0], w[0], SW[0]);
T_Latch Latch2((SW[1] & w[0]), KEY[0], w[1], SW[0]);
T_Latch Latch3((SW[1] & w[0] & w[1]), KEY[0], w[2], SW[0]);
T_Latch Latch4((SW[1] & w[0] & w[1] & w[2]), KEY[0], w[3], SW[0]);
T_Latch Latch5((SW[1] & w[0] & w[1] & w[2] & w[3]), KEY[0], w[4], SW[0]);
T_Latch Latch6((SW[1] & w[0] & w[1] & w[2] & w[3] & w[4]), KEY[0], w[5], SW[0]);
T_Latch Latch7((SW[1] & w[0] & w[1] & w[2] & w[3] & w[4] & w[5]), KEY[0], w[6], SW[0]);
T_Latch Latch8((SW[1] & w[0] & w[1] & w[2] & w[3] & w[4] & w[5] & w[6]), KEY[0], w[7], SW[0]);

always @(w or SW[0]) begin
	Count = w;
	if (!SW[0]) // resets based on SW[0]
		Count = 0;
end

assign HEX0 = (Count % 10 == 0)?`ZERO: // 0
				  (Count % 10 == 1)?`ONE: // 1
				  (Count % 10 == 2)?`TWO: // 2
				  (Count % 10 == 3)?`THREE: // 3
				  (Count % 10 == 4)?`FOUR: // 4
				  (Count % 10 == 5)?`FIVE: // 5
				  (Count % 10 == 6)?`SIX: // 6
				  (Count % 10 == 7)?`SEVEN: // 7
				  (Count % 10 == 8)?`EIGHT: // 8
			     (Count % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = ((Count % 100) / 10 == 0)?`ZERO: // 0
				  ((Count % 100) / 10 == 1)?`ONE: // 1
				  ((Count % 100) / 10 == 2)?`TWO: // 2
				  ((Count % 100) / 10 == 3)?`THREE: // 3
				  ((Count % 100) / 10 == 4)?`FOUR: // 4
				  ((Count % 100) / 10 == 5)?`FIVE: // 5
				  ((Count % 100) / 10 == 6)?`SIX: // 6
				  ((Count % 100) / 10 == 7)?`SEVEN: // 7
				  ((Count % 100) / 10 == 8)?`EIGHT: // 8
			     ((Count % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX2 = ((Count % 1000) / 100 == 0)?`ZERO: // 0
				  ((Count % 1000) / 100 == 1)?`ONE: // 1
				  ((Count % 1000) / 100 == 2)?`TWO: // 2
				  ((Count % 1000) / 100 == 3)?`THREE: // 3
				  ((Count % 1000) / 100 == 4)?`FOUR: // 4
				  ((Count % 1000) / 100 == 5)?`FIVE: // 5
				  ((Count % 1000) / 100 == 6)?`SIX: // 6
				  ((Count % 1000) / 100 == 7)?`SEVEN: // 7
				  ((Count % 1000) / 100 == 8)?`EIGHT: // 8
			     ((Count % 1000) / 100 == 9)?`NINE: // 9
				   `BLANK; // BLANK
endmodule

module T_Latch (T, Clk, Q, reset);
	input T, Clk, reset;
	output reg Q;
	always @ (posedge Clk or negedge reset) begin
		if (~reset) begin
			Q <= 0;
		end else if (T) begin
			Q <= !Q;
		end
	end
endmodule
