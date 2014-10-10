//This lab inputs the number A from the 16 switches, stores it, and displays it on HEX[7:4]. After toggling 
//SW[17] high A is displayed and stored. B is inputted, stored on SW[17] going low, and displayed on HEX[3:0].
//Instructions: place all switches low before starting program. Load program, use SW[15:0] to 
//              input number A. Toggle SW[17] high to store A.
//              Input number B. Toggle SW[17] low to store B.
//					 Both numbers should be displayed on the HEX displays.
//Digits in numbers A and B past the 4th least significant digit will not be displayed.
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

module Lab35_1 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
input [17:0] SW;
output [17:0] LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;

integer A, B;
wire [15:0]numberFromLEDs;

assign numberFromLEDs[15:0] = LEDR[15:0];
assign LEDR = SW;

always @(posedge SW[17]) begin // stores number A
A = numberFromLEDs;
end

always @(negedge SW[17]) begin // stores number B
B = numberFromLEDs;
end

assign HEX0 = (B % 10 == 0)?`ZERO: // 0
				  (B % 10 == 1)?`ONE: // 1
				  (B % 10 == 2)?`TWO: // 2
				  (B % 10 == 3)?`THREE: // 3
				  (B % 10 == 4)?`FOUR: // 4
				  (B % 10 == 5)?`FIVE: // 5
				  (B % 10 == 6)?`SIX: // 6
				  (B % 10 == 7)?`SEVEN: // 7
				  (B % 10 == 8)?`EIGHT: // 8
			     (B % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = ((B % 100) / 10 == 0)?`ZERO: // 0
				  ((B % 100) / 10 == 1)?`ONE: // 1
				  ((B % 100) / 10 == 2)?`TWO: // 2
				  ((B % 100) / 10 == 3)?`THREE: // 3
				  ((B % 100) / 10 == 4)?`FOUR: // 4
				  ((B % 100) / 10 == 5)?`FIVE: // 5
				  ((B % 100) / 10 == 6)?`SIX: // 6
				  ((B % 100) / 10 == 7)?`SEVEN: // 7
				  ((B % 100) / 10 == 8)?`EIGHT: // 8
			     ((B % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX2 = ((B % 1000) / 100 == 0)?`ZERO: // 0
				  ((B % 1000) / 100 == 1)?`ONE: // 1
				  ((B % 1000) / 100 == 2)?`TWO: // 2
				  ((B % 1000) / 100 == 3)?`THREE: // 3
				  ((B % 1000) / 100 == 4)?`FOUR: // 4
				  ((B % 1000) / 100 == 5)?`FIVE: // 5
				  ((B % 1000) / 100 == 6)?`SIX: // 6
				  ((B % 1000) / 100 == 7)?`SEVEN: // 7
				  ((B % 1000) / 100 == 8)?`EIGHT: // 8
			     ((B % 1000) / 100 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX3 = ((B % 10000) / 1000 == 0)?`ZERO: // 0
				  ((B % 10000) / 1000 == 1)?`ONE: // 1
				  ((B % 10000) / 1000 == 2)?`TWO: // 2
				  ((B % 10000) / 1000 == 3)?`THREE: // 3
				  ((B % 10000) / 1000 == 4)?`FOUR: // 4
				  ((B % 10000) / 1000 == 5)?`FIVE: // 5
				  ((B % 10000) / 1000 == 6)?`SIX: // 6
				  ((B % 10000) / 1000 == 7)?`SEVEN: // 7
				  ((B % 10000) / 1000 == 8)?`EIGHT: // 8
			     ((B % 10000) / 1000 == 9)?`NINE: // 9
				   `BLANK; // BLANK
				
assign HEX4 = (A % 10 == 0)?`ZERO: // 0
				  (A % 10 == 1)?`ONE: // 1
				  (A % 10 == 2)?`TWO: // 2
				  (A % 10 == 3)?`THREE: // 3
				  (A % 10 == 4)?`FOUR: // 4
				  (A % 10 == 5)?`FIVE: // 5
				  (A % 10 == 6)?`SIX: // 6
				  (A % 10 == 7)?`SEVEN: // 7
				  (A % 10 == 8)?`EIGHT: // 8
			     (A % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX5 = ((A % 100) / 10 == 0)?`ZERO: // 0
				  ((A % 100) / 10 == 1)?`ONE: // 1
				  ((A % 100) / 10 == 2)?`TWO: // 2
				  ((A % 100) / 10 == 3)?`THREE: // 3
				  ((A % 100) / 10 == 4)?`FOUR: // 4
				  ((A % 100) / 10 == 5)?`FIVE: // 5
				  ((A % 100) / 10 == 6)?`SIX: // 6
				  ((A % 100) / 10 == 7)?`SEVEN: // 7
				  ((A % 100) / 10 == 8)?`EIGHT: // 8
			     ((A % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX6 = ((A % 1000) / 100 == 0)?`ZERO: // 0
				  ((A % 1000) / 100 == 1)?`ONE: // 1
				  ((A % 1000) / 100 == 2)?`TWO: // 2
				  ((A % 1000) / 100 == 3)?`THREE: // 3
				  ((A % 1000) / 100 == 4)?`FOUR: // 4
				  ((A % 1000) / 100 == 5)?`FIVE: // 5
				  ((A % 1000) / 100 == 6)?`SIX: // 6
				  ((A % 1000) / 100 == 7)?`SEVEN: // 7
				  ((A % 1000) / 100 == 8)?`EIGHT: // 8
			     ((A % 1000) / 100 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX7 = ((A % 10000) / 1000 == 0)?`ZERO: // 0
				  ((A % 10000) / 1000 == 1)?`ONE: // 1
				  ((A % 10000) / 1000 == 2)?`TWO: // 2
				  ((A % 10000) / 1000 == 3)?`THREE: // 3
				  ((A % 10000) / 1000 == 4)?`FOUR: // 4
				  ((A % 10000) / 1000 == 5)?`FIVE: // 5
				  ((A % 10000) / 1000 == 6)?`SIX: // 6
				  ((A % 10000) / 1000 == 7)?`SEVEN: // 7
				  ((A % 10000) / 1000 == 8)?`EIGHT: // 8
			     ((A % 10000) / 1000 == 9)?`NINE: // 9
				   `BLANK; // BLANK
endmodule