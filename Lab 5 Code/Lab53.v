//This program uses the system clock to count as a clock would. It increments seconds approximately every
//second. Minutes and hours are rolled over as they should be.
//KEY[3] sets the minutes and hours to the values of SW[6:1] and SW[11:7], respectively
//KEY[0] resets the counter
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

module Lab53 (HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, CLOCK_50, LEDR, SW, KEY);
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;
output[17:0]LEDR;
input [3:0]KEY;
input[17:0]SW;
input CLOCK_50;
wire [25:0]width;
integer seconds, minutes, hours;

assign LEDR = width[25:8];

LPMCOUNTER26BIT myCounter(CLOCK_50, SW[0], ~KEY[0], width);
	
always @(posedge width[25] or negedge KEY[0] or negedge KEY[3]) begin // stores number Count
	
	if (~KEY[1])begin
		hours = SW[11:7];
		minutes = SW[6:1];
		
		hours = hours % 24;
		minutes = minutes % 60;
	end
	else if (~KEY[0]) begin
		seconds = 0;
		minutes = 0;
		hours = 0;
	end
	else begin
		seconds = seconds + 1;
		
		if (seconds >= 60) begin
			seconds = 0;
			minutes = minutes + 1;
		end
		
		if (minutes >=60) begin
			minutes = 0;
			hours = hours + 1;
		end
		
		if (hours >= 24)
			hours = 0;
	end
end

assign HEX2 = (seconds % 10 == 0)?`ZERO: // 0
				  (seconds % 10 == 1)?`ONE: // 1
				  (seconds % 10 == 2)?`TWO: // 2
				  (seconds % 10 == 3)?`THREE: // 3
				  (seconds % 10 == 4)?`FOUR: // 4
				  (seconds % 10 == 5)?`FIVE: // 5
				  (seconds % 10 == 6)?`SIX: // 6
				  (seconds % 10 == 7)?`SEVEN: // 7
				  (seconds % 10 == 8)?`EIGHT: // 8
			     (seconds % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
assign HEX3 = ((seconds % 100) / 10 == 0)?`ZERO: // 0
				  ((seconds % 100) / 10 == 1)?`ONE: // 1
				  ((seconds % 100) / 10 == 2)?`TWO: // 2
				  ((seconds % 100) / 10 == 3)?`THREE: // 3
				  ((seconds % 100) / 10 == 4)?`FOUR: // 4
				  ((seconds % 100) / 10 == 5)?`FIVE: // 5
				  ((seconds % 100) / 10 == 6)?`SIX: // 6
				  ((seconds % 100) / 10 == 7)?`SEVEN: // 7
				  ((seconds % 100) / 10 == 8)?`EIGHT: // 8
			     ((seconds % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX4 = (minutes % 10 == 0)?`ZERO: // 0
				  (minutes % 10 == 1)?`ONE: // 1
				  (minutes % 10 == 2)?`TWO: // 2
				  (minutes % 10 == 3)?`THREE: // 3
				  (minutes % 10 == 4)?`FOUR: // 4
				  (minutes % 10 == 5)?`FIVE: // 5
				  (minutes % 10 == 6)?`SIX: // 6
				  (minutes % 10 == 7)?`SEVEN: // 7
				  (minutes % 10 == 8)?`EIGHT: // 8
			     (minutes % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
assign HEX5 = ((minutes % 100) / 10 == 0)?`ZERO: // 0
				  ((minutes % 100) / 10 == 1)?`ONE: // 1
				  ((minutes % 100) / 10 == 2)?`TWO: // 2
				  ((minutes % 100) / 10 == 3)?`THREE: // 3
				  ((minutes % 100) / 10 == 4)?`FOUR: // 4
				  ((minutes % 100) / 10 == 5)?`FIVE: // 5
				  ((minutes % 100) / 10 == 6)?`SIX: // 6
				  ((minutes % 100) / 10 == 7)?`SEVEN: // 7
				  ((minutes % 100) / 10 == 8)?`EIGHT: // 8
			     ((minutes % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX6 = (hours % 10 == 0)?`ZERO: // 0
				  (hours % 10 == 1)?`ONE: // 1
				  (hours % 10 == 2)?`TWO: // 2
				  (hours % 10 == 3)?`THREE: // 3
				  (hours % 10 == 4)?`FOUR: // 4
				  (hours % 10 == 5)?`FIVE: // 5
				  (hours % 10 == 6)?`SIX: // 6
				  (hours % 10 == 7)?`SEVEN: // 7
				  (hours % 10 == 8)?`EIGHT: // 8
			     (hours % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
assign HEX7 = ((hours % 100) / 10 == 0)?`ZERO: // 0
				  ((hours % 100) / 10 == 1)?`ONE: // 1
				  ((hours % 100) / 10 == 2)?`TWO: // 2
				  ((hours % 100) / 10 == 3)?`THREE: // 3
				  ((hours % 100) / 10 == 4)?`FOUR: // 4
				  ((hours % 100) / 10 == 5)?`FIVE: // 5
				  ((hours % 100) / 10 == 6)?`SIX: // 6
				  ((hours % 100) / 10 == 7)?`SEVEN: // 7
				  ((hours % 100) / 10 == 8)?`EIGHT: // 8
			     ((hours % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
endmodule
