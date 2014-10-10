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

//This program converts a four bit binary number into its respective decimal number, and displays it on
//the first two HEX displays.
module Lab22 (SW, LEDR, HEX0, HEX1);

input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
assign LEDR = SW;

integer number = 0;
wire [3:0]numberFromSwitches;
assign numberFromSwitches[3:0] = SW[3:0];

assign HEX0 = ((number % 10) == 0)?`ZERO: // 0
				  ((number % 10) == 1)?`ONE: // 1
				  ((number % 10) == 2)?`TWO: // 2
				  ((number % 10) == 3)?`THREE: // 3
				  ((number % 10) == 4)?`FOUR: // 4
				  ((number % 10) == 5)?`FIVE: // 5
				  ((number % 10) == 6)?`SIX: // 6
				  ((number % 10) == 7)?`SEVEN: // 7
				  ((number % 10) == 8)?`EIGHT: // 8
			     ((number % 10) == 9)?`NINE: // 9
				   `BLANK; // BLANK

assign HEX1 = (number/10 == 0)?`ZERO: // 0
				  (number/10 == 1)?`ONE: // 1
				   `BLANK; // BLANK

always @(numberFromSwitches)
begin
	number = numberFromSwitches;
end
		
endmodule
