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
//This program is an extension of Lab23. This program takes the two four bit numbers added together,
//as well as the carry out, and displays this 5 bit number in decimal onto the first two HEX displays
//SW[3:0] is the first number, and SW[7:4] is the second. SW[8] is the carry-in.
module Lab24 (SW, LEDG, LEDR, HEX0, HEX1);
input [17:0] SW;
output [8:0] LEDR, LEDG;
output [6:0]HEX0;
output [6:0]HEX1;
wire [4:0]addedNumber;
wire c1, c2, c3;
integer number = 0;
integer firstNumber = 0;
integer secondNumber = 0;

assign LEDR[8:0] = SW[8:0];
assign addedNumber[4:0] = LEDG[4:0];
assign HEX0 = (secondNumber == 0)?`ZERO: // 0
				  (secondNumber == 1)?`ONE: // 1
				  (secondNumber == 2)?`TWO: // 2
				  (secondNumber == 3)?`THREE: // 3
				  (secondNumber == 4)?`FOUR: // 4
				  (secondNumber == 5)?`FIVE: // 5
				  (secondNumber == 6)?`SIX: // 6
				  (secondNumber == 7)?`SEVEN: // 7
				  (secondNumber == 8)?`EIGHT: // 8
			     (secondNumber == 9)?`NINE: // 9
				   `BLANK; // BLANK

assign HEX1 = (firstNumber == 0)?`ZERO: // 0
				  (firstNumber == 1)?`ONE: // 1
				  (firstNumber == 2)?`TWO: // 2
				  (firstNumber == 3)?`THREE: // 3
				   `BLANK; // BLANK



fulladder A0 (SW[0], SW[4], SW[8], LEDG[0], c1);
fulladder A1 (SW[1], SW[5], c1, LEDG[1], c2);
fulladder A2 (SW[2], SW[6], c2, LEDG[2], c3);
fulladder A3 (SW[3], SW[7], c3, LEDG[3], LEDG[4]);

always @(addedNumber)
begin
	number = addedNumber;

	if (number <= 9) 
	begin
		firstNumber = 0;
		secondNumber = number;
	end
	if (number > 9) 
	begin
		firstNumber = 1;
		secondNumber = number - 10;
	end
	if (number > 19) 
	begin
		firstNumber = 2;
		secondNumber = number - 20;
	end
	if (number > 29) 
	begin
		firstNumber = 3;
		secondNumber = number - 30;
	end
	
end
endmodule

// this is the fulladder, it is commented out because Quartus doesn't like having the same module defined 
// in two different .v files. It is currently defined in Lab23.v
/*module fulladder (a, b, ci, s, co);
input a, b, ci;
output co, s;

wire d;

assign d = a ^ b;
assign s = d ^ ci;
assign co = (b & ~d) | (d & ci);
endmodule*/