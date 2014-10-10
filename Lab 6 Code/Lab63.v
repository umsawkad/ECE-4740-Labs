//This program uses verilog code to implement a four bit multiplier, and display the result onto HEX[2:0]
//HEX[7:6] is number A, HEX[5:4] is numberB
//SW[11:8] is for inputting numberA
//SW[3:0] is for inputting numberB
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

module Lab63 (SW, LEDR, HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;
input [3:0]KEY;
integer Count, numberA, numberB;

assign LEDR = SW;

always @(SW) begin
	numberA = SW[11:8];
	numberB = SW[3:0];
end

always @(numberA or numberB) begin
	Count = numberA*numberB;
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
					
assign HEX4 = (numberB % 10 == 0)?`ZERO: // 0
				  (numberB % 10 == 1)?`ONE: // 1
				  (numberB % 10 == 2)?`TWO: // 2
				  (numberB % 10 == 3)?`THREE: // 3
				  (numberB % 10 == 4)?`FOUR: // 4
				  (numberB % 10 == 5)?`FIVE: // 5
				  (numberB % 10 == 6)?`SIX: // 6
				  (numberB % 10 == 7)?`SEVEN: // 7
				  (numberB % 10 == 8)?`EIGHT: // 8
			     (numberB % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX5 = (numberB / 10 == 0)?`ZERO: // 0
				  (numberB / 10 == 1)?`ONE: // 1
				  (numberB / 10 == 2)?`TWO: // 2
				  (numberB / 10 == 3)?`THREE: // 3
				  (numberB / 10 == 4)?`FOUR: // 4
				  (numberB / 10 == 5)?`FIVE: // 5
				  (numberB / 10 == 6)?`SIX: // 6
				  (numberB / 10 == 7)?`SEVEN: // 7
				  (numberB / 10 == 8)?`EIGHT: // 8
			     (numberB / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX6 = (numberA % 10 == 0)?`ZERO: // 0
				  (numberA % 10 == 1)?`ONE: // 1
				  (numberA % 10 == 2)?`TWO: // 2
				  (numberA % 10 == 3)?`THREE: // 3
				  (numberA % 10 == 4)?`FOUR: // 4
				  (numberA % 10 == 5)?`FIVE: // 5
				  (numberA % 10 == 6)?`SIX: // 6
				  (numberA % 10 == 7)?`SEVEN: // 7
				  (numberA % 10 == 8)?`EIGHT: // 8
			     (numberA % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX7 = (numberA / 10 == 0)?`ZERO: // 0
				  (numberA / 10 == 1)?`ONE: // 1
				  (numberA / 10 == 2)?`TWO: // 2
				  (numberA / 10 == 3)?`THREE: // 3
				  (numberA / 10 == 4)?`FOUR: // 4
				  (numberA / 10 == 5)?`FIVE: // 5
				  (numberA / 10 == 6)?`SIX: // 6
				  (numberA / 10 == 7)?`SEVEN: // 7
				  (numberA / 10 == 8)?`EIGHT: // 8
			     (numberA / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK					
					
endmodule

