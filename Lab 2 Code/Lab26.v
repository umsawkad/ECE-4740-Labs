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

//This program uses verilog code to emulate a 2 digit BCD adder. It displays the 3 digit result onto HEX[2:0]
//HEX[5:4] and HEX [7:6] are the two numbers that get added together
// LEDG4 is the final carry out of the ripple carry adder
// LEDG[3:0] is the result of the adder
// SW[8] is the carry in into the adder
// SW[7:4] is the number to add to SW[3:0]
module Lab26 (SW, LEDR, HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7);
input [17:0] SW;
output [17:0] LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;

wire [7:0]NumberL;
wire [7:0]NumberR;
integer c1, c2;
integer finalNumber = 0, numberL = 0, numberR = 0, T0 = 0, T1 = 0, S0 = 0, S1 = 0, S2 = 0, Z0 = 0, Z1 = 0;

assign LEDR = SW;

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

always @(SW)
begin
	numberL = NumberL;
	numberR = NumberR;
	
	T0 = numberL % 10 + numberR % 10;
	if (T0 > 9) begin
		Z0 = 10;
		c1 = 1;
	end
	else begin
		Z0 = 0;
		c1 = 0;
	end
	S0 = T0 - Z0;
	
	T1 = (numberL % 100) / 10 + (numberR % 100) / 10 + c1;
	if (T1 > 9) begin
		Z1 = 10;
		c2 = 1;
	end
	else begin
		Z1 = 0;
		c2 = 0;
	end
	S1 = T1 - Z1;
	S2 = c2;
	
	finalNumber = S0 + (S1*10) + (S2*100);
	
end




endmodule
