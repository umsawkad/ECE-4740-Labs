//This program uses the system clock to rotate the string "HELLO   " across the eight HEX displays
//The letters rotate approximately every second
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
`define H 7'b0001001
`define E 7'b0000110
`define L 7'b1000111

module Lab45 (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, CLOCK_50, LEDR, SW);
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;
output[17:0]LEDR;
input[17:0]SW;
input CLOCK_50;
wire [25:0]width;

integer Cycle = 0;

assign LEDR = width[25:8];

LPMCOUNTER26BIT myCounter(CLOCK_50, SW[1], ~SW[0], width);
	
always @(posedge width[25]) begin // stores number Count
	Cycle = Cycle + 1;
	Cycle = Cycle % 8;
end

assign HEX0 = (Cycle == 0)?`ZERO: 
				  (Cycle == 1)?`BLANK: 
				  (Cycle == 2)?`BLANK: 
				  (Cycle == 3)?`BLANK: 
				  (Cycle == 4)?`H: 
				  (Cycle == 5)?`E: 
				  (Cycle == 6)?`L: 
				  (Cycle == 7)?`L:  
				   `BLANK; 
					
assign HEX1 = (Cycle == 0)?`L: 
				  (Cycle == 1)?`ZERO: 
				  (Cycle == 2)?`BLANK: 
				  (Cycle == 3)?`BLANK: 
				  (Cycle == 4)?`BLANK: 
				  (Cycle == 5)?`H: 
				  (Cycle == 6)?`E: 
				  (Cycle == 7)?`L:  
				   `BLANK; 
		
assign HEX2 = (Cycle == 0)?`L: 
				  (Cycle == 1)?`L: 
				  (Cycle == 2)?`ZERO: 
				  (Cycle == 3)?`BLANK: 
				  (Cycle == 4)?`BLANK: 
				  (Cycle == 5)?`BLANK: 
				  (Cycle == 6)?`H: 
				  (Cycle == 7)?`E:  
				   `BLANK; 

	
assign HEX3 = (Cycle == 0)?`E: 
				  (Cycle == 1)?`L: 
				  (Cycle == 2)?`L: 
				  (Cycle == 3)?`ZERO: 
				  (Cycle == 4)?`BLANK: 
				  (Cycle == 5)?`BLANK: 
				  (Cycle == 6)?`BLANK: 
				  (Cycle == 7)?`H:  
				   `BLANK; 
			
assign HEX4 = (Cycle == 0)?`H: 
				  (Cycle == 1)?`E: 
				  (Cycle == 2)?`L: 
				  (Cycle == 3)?`L: 
				  (Cycle == 4)?`ZERO: 
				  (Cycle == 5)?`BLANK: 
				  (Cycle == 6)?`BLANK: 
				  (Cycle == 7)?`BLANK:  
				   `BLANK; 			

assign HEX5 = (Cycle == 0)?`BLANK: 
				  (Cycle == 1)?`H: 
				  (Cycle == 2)?`E: 
				  (Cycle == 3)?`L: 
				  (Cycle == 4)?`L: 
				  (Cycle == 5)?`ZERO: 
				  (Cycle == 6)?`BLANK: 
				  (Cycle == 7)?`BLANK:  
				   `BLANK; 		

assign HEX6 = (Cycle == 0)?`BLANK: 
				  (Cycle == 1)?`BLANK: 
				  (Cycle == 2)?`H: 
				  (Cycle == 3)?`E: 
				  (Cycle == 4)?`L: 
				  (Cycle == 5)?`L: 
				  (Cycle == 6)?`ZERO: 
				  (Cycle == 7)?`BLANK:  
				   `BLANK; 		

assign HEX7 = (Cycle == 0)?`BLANK: 
				  (Cycle == 1)?`BLANK: 
				  (Cycle == 2)?`BLANK: 
				  (Cycle == 3)?`H: 
				  (Cycle == 4)?`E: 
				  (Cycle == 5)?`L: 
				  (Cycle == 6)?`L: 
				  (Cycle == 7)?`ZERO:  
				   `BLANK; 		
	
endmodule
