//This program uses verilog code to implement an 8 bit adder, and display the result onto HEX[2:0]
//KEY[0] is asynchronous reset
//KEY[3] is the clock
//SW[7:0] is for inputting the numbers
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

module Lab61 (SW, LEDR, HEX0, HEX1, HEX2, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
input [3:0]KEY;
integer Count, numberA;
reg overflow;

assign LEDR[7:0] = SW[7:0];

always @(posedge KEY[3] or negedge KEY[0]) begin // increments number Count
	numberA = SW[7:0];
	
	if (!KEY[0]) begin 
		Count = 0;
		overflow <= 0;
	end
	else begin
		Count = numberA + Count;
		if (Count > 255) begin
			Count = Count % 255;
			overflow <= 1;
		end
	end
end

assign LEDR[8] = (overflow == 1)?1:
						0;

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
					
endmodule

