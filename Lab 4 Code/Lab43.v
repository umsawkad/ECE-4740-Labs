//This program uses a LPM module to implement a 16 bit counter, and display the count onto HEX[4:0]
//KEY[0] is the clock
//SW[0] is Clear. To clear the count, place clear LOW, then press KEY[0]
//SW[1] is Enable when high
//This design was found to use less logic elements than the prevous, home made version. 
//Otherwise, it behaves the same.
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

module Lab43 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
input [3:0]KEY;
integer Count;
wire [15:0]width;

assign LEDR = SW;

LPMCOUNTER myCounter(KEY[0], SW[1], ~SW[0], width);
	
always @(width) begin // stores number Count
	Count = width;
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
					
assign HEX3 = ((Count % 10000) / 1000 == 0)?`ZERO: // 0
				  ((Count % 10000) / 1000 == 1)?`ONE: // 1
				  ((Count % 10000) / 1000 == 2)?`TWO: // 2
				  ((Count % 10000) / 1000 == 3)?`THREE: // 3
				  ((Count % 10000) / 1000 == 4)?`FOUR: // 4
				  ((Count % 10000) / 1000 == 5)?`FIVE: // 5
				  ((Count % 10000) / 1000 == 6)?`SIX: // 6
				  ((Count % 10000) / 1000 == 7)?`SEVEN: // 7
				  ((Count % 10000) / 1000 == 8)?`EIGHT: // 8
			     ((Count % 10000) / 1000 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX4 = ((Count % 10000) / 10000 == 0)?`ZERO: // 0
				  ((Count % 100000) / 10000 == 1)?`ONE: // 1
				  ((Count % 100000) / 10000 == 2)?`TWO: // 2
				  ((Count % 100000) / 10000 == 3)?`THREE: // 3
				  ((Count % 100000) / 10000 == 4)?`FOUR: // 4
				  ((Count % 100000) / 10000 == 5)?`FIVE: // 5
				  ((Count % 100000) / 10000 == 6)?`SIX: // 6
				  ((Count % 100000) / 10000 == 7)?`SEVEN: // 7
				  ((Count % 100000) / 10000 == 8)?`EIGHT: // 8
			     ((Count % 100000) / 10000 == 9)?`NINE: // 9
				   `BLANK; // BLANK
endmodule

