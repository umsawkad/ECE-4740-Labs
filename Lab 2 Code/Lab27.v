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

//This program converts a six digit binary number denoted by SW[5:0] into a two digit decimal number, 
//denoted by HEX[1:0].
module Lab27 (SW, LEDR, HEX0, HEX1);
input [5:0]SW;
output [5:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
integer Number = 0;

wire [5:0]BinaryNumber;
assign LEDR = SW;
assign BinaryNumber = LEDR;

assign HEX0 = (Number % 10 == 0)?`ZERO: // 0
				  (Number % 10 == 1)?`ONE: // 1
				  (Number % 10 == 2)?`TWO: // 2
				  (Number % 10 == 3)?`THREE: // 3
				  (Number % 10 == 4)?`FOUR: // 4
				  (Number % 10 == 5)?`FIVE: // 5
				  (Number % 10 == 6)?`SIX: // 6
				  (Number % 10 == 7)?`SEVEN: // 7
				  (Number % 10 == 8)?`EIGHT: // 8
			     (Number % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = ((Number % 100) / 10 == 0)?`ZERO: // 0
				  ((Number % 100) / 10 == 1)?`ONE: // 1
				  ((Number % 100) / 10 == 2)?`TWO: // 2
				  ((Number % 100) / 10 == 3)?`THREE: // 3
				  ((Number % 100) / 10 == 4)?`FOUR: // 4
				  ((Number % 100) / 10 == 5)?`FIVE: // 5
				  ((Number % 100) / 10 == 6)?`SIX: // 6
				  ((Number % 100) / 10 == 7)?`SEVEN: // 7
				  ((Number % 100) / 10 == 8)?`EIGHT: // 8
			     ((Number % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK

always @(SW)
begin
	Number = BinaryNumber;
end
endmodule