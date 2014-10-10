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
// LEDG4 is the final carry out of the ripple carry adder
// LEDG[3:0] is the result of the adder
// SW[8] is the carry in into the adder
// SW[7:4] is the number to add to SW[3:0]
//This program extends Lab24.v to add two 2 digit BCD numbers. It displays the 3 digit result onto HEX[2:0]
//HEX[5:4] and HEX [7:6] are the two numbers that get added together
module Lab25 (SW, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
input [17:0] SW;
output [17:0] LEDR;
output [7:0] LEDG;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;

wire [7:0]addedNumber;
wire [7:0]NumberL;
wire [7:0]NumberR;
wire c1, c2, c3, c4, c5, c6, c7, c8;
integer finalNumber = 0, numberL = 0, numberR = 0;

assign LEDR = SW;
assign addedNumber[7:0] = LEDG[7:0];
assign NumberL[7:0] = LEDR[15:8];
assign NumberR[7:0] = LEDR[7:0];

assign HEX0 = (finalNumber % 10 == 0)?`ZERO: // 0
				  (finalNumber % 10 == 1)?`ONE: // 1
				  (finalNumber % 10 == 2)?`TWO: // 2
				  (finalNumber % 10 == 3)?`THREE: // 3
				  (finalNumber % 10 == 4)?`FOUR: // 4
				  (finalNumber % 10 == 5)?`FIVE: // 5
				  (finalNumber % 10 == 6)?`SIX: // 6
				  (finalNumber % 10 == 7)?`SEVEN: // 7
				  (finalNumber % 10 == 8)?`EIGHT: // 8
			     (finalNumber % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = ((finalNumber % 100) / 10 == 0)?`ZERO: // 0
				  ((finalNumber % 100) / 10 == 1)?`ONE: // 1
				  ((finalNumber % 100) / 10 == 2)?`TWO: // 2
				  ((finalNumber % 100) / 10 == 3)?`THREE: // 3
				  ((finalNumber % 100) / 10 == 4)?`FOUR: // 4
				  ((finalNumber % 100) / 10 == 5)?`FIVE: // 5
				  ((finalNumber % 100) / 10 == 6)?`SIX: // 6
				  ((finalNumber % 100) / 10 == 7)?`SEVEN: // 7
				  ((finalNumber % 100) / 10 == 8)?`EIGHT: // 8
			     ((finalNumber % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX2 = (finalNumber / 100 == 0)?`ZERO: // 0
				  (finalNumber / 100 == 1)?`ONE: // 1
				  (finalNumber / 100 == 2)?`TWO: // 2
				  (finalNumber / 100 == 3)?`THREE: // 3
				  (finalNumber / 100 == 4)?`FOUR: // 4
				  (finalNumber / 100 == 5)?`FIVE: // 5
				  (finalNumber / 100 == 6)?`SIX: // 6
				  (finalNumber / 100 == 7)?`SEVEN: // 7
				  (finalNumber / 100 == 8)?`EIGHT: // 8
			     (finalNumber / 100 == 9)?`NINE: // 9
				   `BLANK; // BLANK
				
assign HEX4 = (numberR % 10 == 0)?`ZERO: // 0
				  (numberR % 10 == 1)?`ONE: // 1
				  (numberR % 10 == 2)?`TWO: // 2
				  (numberR % 10 == 3)?`THREE: // 3
				  (numberR % 10 == 4)?`FOUR: // 4
				  (numberR % 10 == 5)?`FIVE: // 5
				  (numberR % 10 == 6)?`SIX: // 6
				  (numberR % 10 == 7)?`SEVEN: // 7
				  (numberR % 10 == 8)?`EIGHT: // 8
			     (numberR % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX5 = ((numberR % 100) / 10 == 0)?`ZERO: // 0
				  ((numberR % 100) / 10 == 1)?`ONE: // 1
				  ((numberR % 100) / 10 == 2)?`TWO: // 2
				  ((numberR % 100) / 10 == 3)?`THREE: // 3
				  ((numberR % 100) / 10 == 4)?`FOUR: // 4
				  ((numberR % 100) / 10 == 5)?`FIVE: // 5
				  ((numberR % 100) / 10 == 6)?`SIX: // 6
				  ((numberR % 100) / 10 == 7)?`SEVEN: // 7
				  ((numberR % 100) / 10 == 8)?`EIGHT: // 8
			     ((numberR % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX6 = (numberL % 10 == 0)?`ZERO: // 0
				  (numberL % 10 == 1)?`ONE: // 1
				  (numberL % 10 == 2)?`TWO: // 2
				  (numberL % 10 == 3)?`THREE: // 3
				  (numberL % 10 == 4)?`FOUR: // 4
				  (numberL % 10 == 5)?`FIVE: // 5
				  (numberL % 10 == 6)?`SIX: // 6
				  (numberL % 10 == 7)?`SEVEN: // 7
				  (numberL % 10 == 8)?`EIGHT: // 8
			     (numberL % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX7 = ((numberL % 100) / 10 == 0)?`ZERO: // 0
				  ((numberL % 100) / 10 == 1)?`ONE: // 1
				  ((numberL % 100) / 10 == 2)?`TWO: // 2
				  ((numberL % 100) / 10 == 3)?`THREE: // 3
				  ((numberL % 100) / 10 == 4)?`FOUR: // 4
				  ((numberL % 100) / 10 == 5)?`FIVE: // 5
				  ((numberL % 100) / 10 == 6)?`SIX: // 6
				  ((numberL % 100) / 10 == 7)?`SEVEN: // 7
				  ((numberL % 100) / 10 == 8)?`EIGHT: // 8
			     ((numberL % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK


// adder   SW[input1       carry in       carry out
//                SW[input2]     result
fulladder A0 (SW[0], SW[8], 0, LEDG[0], c1);
fulladder A1 (SW[1], SW[9], c1, LEDG[1], c2);
fulladder A2 (SW[2], SW[10], c2, LEDG[2], c3);
fulladder A3 (SW[3], SW[11], c3, LEDG[3], c4);
fulladder A4 (SW[4], SW[12], c4, LEDG[4], c5);
fulladder A5 (SW[5], SW[13], c5, LEDG[5], c6);
fulladder A6 (SW[6], SW[14], c6, LEDG[6], c7);
fulladder A7 (SW[7], SW[15], c7, LEDG[7], c8);

always @(addedNumber or NumberL or NumberR)
begin
	finalNumber = addedNumber;
	if (c8 == 1)
		finalNumber = finalNumber + 256;
	numberL = NumberL;
	numberR = NumberR;
end
endmodule
//Previously defined in Lab23.v
/*module fulladder (a, b, ci, s, co);
input a, b, ci;
output co, s;

wire d;

assign d = a ^ b;
assign s = d ^ ci;
assign co = (b & ~d) | (d & ci);
endmodule*/