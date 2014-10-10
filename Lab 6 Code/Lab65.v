//This program uses verilog code to implement a 8x8 array tree adder to implement a multiplier, and display the result onto HEX[3:0]
//HEX[7:6] is number A, HEX[5:4] is numberB
//SW[15:8] is for inputting numberA
//SW[7:0] is for inputting numberB
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

module Lab65 (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, KEY);
input [17:0]SW;
output [17:0]LEDR;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;
input [3:0]KEY;
integer Count, numberA, numberB, i, j, done = 0;
reg [15:0]Tree1[255:0];
reg [15:0]Tree2[127:0];
reg [15:0]Tree3[63:0];
reg [15:0]Tree4[31:0];
reg [15:0]Tree5[15:0];
reg [15:0]Tree6[7:0];
reg [15:0]Tree7[3:0];
assign LEDR = SW;

always @(SW) begin
	numberA = SW[15:8];
	numberB = SW[7:0];
	if (numberA != 0 && numberB != 0) begin
		for (i = 0; i < 256; i = i + 1) begin
			if (i < numberA) begin
				Tree1[i] = numberB;
			end
			else
				Tree1[i] = 0;
		end
			
		for (i = 0; i < 128; i = i + 1) begin
			Tree2[i] = Tree1[2*i] + Tree1[2*i+1];
		end
		
		for (i = 0; i < 64; i = i + 1) begin
			Tree3[i] = Tree2[2*i] + Tree2[2*i+1];
		end
				
		for (i = 0; i < 32; i = i + 1) begin
			Tree4[i] = Tree3[2*i] + Tree3[2*i+1];
		end		
				
		for (i = 0; i < 16; i = i + 1) begin
			Tree5[i] = Tree4[2*i] + Tree4[2*i+1];
		end
		
		for (i = 0; i < 8; i = i + 1) begin
			Tree6[i] = Tree5[2*i] + Tree5[2*i+1];
		end

		for (i = 0; i < 4; i = i + 1) begin
			Tree7[i] = Tree6[2*i] + Tree6[2*i+1];
		end
		
		Count = Tree7[0] + Tree7[1] + Tree7[2] + Tree7[3];
	end
	else
		Count = 0;
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

assign HEX3 = ((Count % 10000) / 1000 == 0)?`ZERO: // 0
				  ((Count % 10000) / 1000 == 1)?`ONE: // 1
				  ((Count % 10000) / 1000 == 2)?`TWO: // 2
				  ((Count % 10000) / 1000 == 3)?`THREE: // 3
				  ((Count % 10000) / 1000 == 4)?`FOUR: // 4
				  ((Count % 10000) / 1000 == 5)?`FIVE: // 5
				  ((Count % 10000) / 1000 == 6)?`SIX: // 6
				  ((Count % 10000) / 1000 == 7)?`SEVEN: // 7
				  ((Count % 10000) / 1000 == 8)?`EIGHT: // 8
			     ((Count % 10000) / 1000 == 9)?`NINE: // 9
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
				
assign HEX5 = ((numberB % 100) / 10 == 0)?`ZERO: // 0
				  ((numberB % 100) / 10 == 1)?`ONE: // 1
				  ((numberB % 100) / 10 == 2)?`TWO: // 2
				  ((numberB % 100) / 10 == 3)?`THREE: // 3
				  ((numberB % 100) / 10 == 4)?`FOUR: // 4
				  ((numberB % 100) / 10 == 5)?`FIVE: // 5
				  ((numberB % 100) / 10 == 6)?`SIX: // 6
				  ((numberB % 100) / 10 == 7)?`SEVEN: // 7
				  ((numberB % 100) / 10 == 8)?`EIGHT: // 8
			     ((numberB % 100) / 10 == 9)?`NINE: // 9
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
					
assign HEX7 = ((numberA % 100) / 10 == 0)?`ZERO: // 0
				  ((numberA % 100) / 10 == 1)?`ONE: // 1
				  ((numberA % 100) / 10 == 2)?`TWO: // 2
				  ((numberA % 100) / 10 == 3)?`THREE: // 3
				  ((numberA % 100) / 10 == 4)?`FOUR: // 4
				  ((numberA % 100) / 10 == 5)?`FIVE: // 5
				  ((numberA % 100) / 10 == 6)?`SIX: // 6
				  ((numberA % 100) / 10 == 7)?`SEVEN: // 7
				  ((numberA % 100) / 10 == 8)?`EIGHT: // 8
			     ((numberA % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
endmodule
