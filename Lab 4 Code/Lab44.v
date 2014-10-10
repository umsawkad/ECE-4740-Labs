//This program uses the system clock to rotate the numbers 0-9 on HEX0. It rotates approximately every second
//SW[1] toggles the counter to count when high, and pause when low
//SW[0] resets the counter when low, and lets it count when high 
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

module Lab44 (HEX0, CLOCK_50, LEDR, SW);
output [6:0]HEX0;
output[17:0]LEDR;
input[17:0]SW;
input CLOCK_50;
wire [25:0]width;
integer Count = 0;
integer iterationLimit = 16000000;
integer iterationCount;
reg reset;

assign LEDR = width[25:8];

LPMCOUNTER26BIT myCounter(CLOCK_50, SW[1], ~SW[0], width);
	
always @(posedge width[25]) begin // stores number Count
	Count = (Count % 10) + 1;
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
endmodule
