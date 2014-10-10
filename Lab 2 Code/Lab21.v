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

//This program displays four numbers onto the four hex displays
//SW[15:12] is the number on HEX3, SW[11:8] is HEX2, SW[7:4] is HEX1, and SW[3:0] is HEX0
module Lab21 (SW, LEDR, HEX0, HEX1, HEX2, HEX3);

input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;

assign LEDR = SW;

assign HEX0 = (SW[3] == 0 && SW[2] == 0  && SW[1] == 0 && SW[0] == 0)?`ZERO: // 0
				  (SW[3] == 0 && SW[2] == 0  && SW[1] == 0 && SW[0] == 1)?`ONE: // 1
				  (SW[3] == 0 && SW[2] == 0  && SW[1] == 1 && SW[0] == 0)?`TWO: // 2
				  (SW[3] == 0 && SW[2] == 0  && SW[1] == 1 && SW[0] == 1)?`THREE: // 3
				  (SW[3] == 0 && SW[2] == 1  && SW[1] == 0 && SW[0] == 0)?`FOUR: // 4
				  (SW[3] == 0 && SW[2] == 1  && SW[1] == 0 && SW[0] == 1)?`FIVE: // 5
				  (SW[3] == 0 && SW[2] == 1  && SW[1] == 1 && SW[0] == 0)?`SIX: // 6
				  (SW[3] == 0 && SW[2] == 1  && SW[1] == 1 && SW[0] == 1)?`SEVEN: // 7
				  (SW[3] == 1 && SW[2] == 0  && SW[1] == 0 && SW[0] == 0)?`EIGHT: // 8
			     (SW[3] == 1 && SW[2] == 0  && SW[1] == 0 && SW[0] == 1)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = (SW[7] == 0 && SW[6] == 0  && SW[5] == 0 && SW[4] == 0)?`ZERO: // 0
				  (SW[7] == 0 && SW[6] == 0  && SW[5] == 0 && SW[4] == 1)?`ONE: // 1
				  (SW[7] == 0 && SW[6] == 0  && SW[5] == 1 && SW[4] == 0)?`TWO: // 2
				  (SW[7] == 0 && SW[6] == 0  && SW[5] == 1 && SW[4] == 1)?`THREE: // 3
				  (SW[7] == 0 && SW[6] == 1  && SW[5] == 0 && SW[4] == 0)?`FOUR: // 4
				  (SW[7] == 0 && SW[6] == 1  && SW[5] == 0 && SW[4] == 1)?`FIVE: // 5
				  (SW[7] == 0 && SW[6] == 1  && SW[5] == 1 && SW[4] == 0)?`SIX: // 6
				  (SW[7] == 0 && SW[6] == 1  && SW[5] == 1 && SW[4] == 1)?`SEVEN: // 7
				  (SW[7] == 1 && SW[6] == 0  && SW[5] == 0 && SW[4] == 0)?`EIGHT: // 8
			     (SW[7] == 1 && SW[6] == 0  && SW[5] == 0 && SW[4] == 1)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX2 = (SW[11] == 0 && SW[10] == 0  && SW[9] == 0 && SW[8] == 0)?`ZERO: // 0
				  (SW[11] == 0 && SW[10] == 0  && SW[9] == 0 && SW[8] == 1)?`ONE: // 1
				  (SW[11] == 0 && SW[10] == 0  && SW[9] == 1 && SW[8] == 0)?`TWO: // 2
				  (SW[11] == 0 && SW[10] == 0  && SW[9] == 1 && SW[8] == 1)?`THREE: // 3
				  (SW[11] == 0 && SW[10] == 1  && SW[9] == 0 && SW[8] == 0)?`FOUR: // 4
				  (SW[11] == 0 && SW[10] == 1  && SW[9] == 0 && SW[8] == 1)?`FIVE: // 5
				  (SW[11] == 0 && SW[10] == 1  && SW[9] == 1 && SW[8] == 0)?`SIX: // 6
				  (SW[11] == 0 && SW[10] == 1  && SW[9] == 1 && SW[8] == 1)?`SEVEN: // 7
				  (SW[11] == 1 && SW[10] == 0  && SW[9] == 0 && SW[8] == 0)?`EIGHT: // 8
			     (SW[11] == 1 && SW[10] == 0  && SW[9] == 0 && SW[8] == 1)?`NINE: // 9
				   `BLANK; // BLANK

assign HEX3 = (SW[15] == 0 && SW[14] == 0  && SW[13] == 0 && SW[12] == 0)?`ZERO: // 0
				  (SW[15] == 0 && SW[14] == 0  && SW[13] == 0 && SW[12] == 1)?`ONE: // 1
				  (SW[15] == 0 && SW[14] == 0  && SW[13] == 1 && SW[12] == 0)?`TWO: // 2
				  (SW[15] == 0 && SW[14] == 0  && SW[13] == 1 && SW[12] == 1)?`THREE: // 3
				  (SW[15] == 0 && SW[14] == 1  && SW[13] == 0 && SW[12] == 0)?`FOUR: // 4
				  (SW[15] == 0 && SW[14] == 1  && SW[13] == 0 && SW[12] == 1)?`FIVE: // 5
				  (SW[15] == 0 && SW[14] == 1  && SW[13] == 1 && SW[12] == 0)?`SIX: // 6
				  (SW[15] == 0 && SW[14] == 1  && SW[13] == 1 && SW[12] == 1)?`SEVEN: // 7
				  (SW[15] == 1 && SW[14] == 0  && SW[13] == 0 && SW[12] == 0)?`EIGHT: // 8
			     (SW[15] == 1 && SW[14] == 0  && SW[13] == 0 && SW[12] == 1)?`NINE: // 9
				   `BLANK; // BLANK

endmodule