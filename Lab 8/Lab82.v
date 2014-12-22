//This program uses an lpm module for extra ram
//SW[7:0] is the data input to the RAM module
//SW[15-11] is the address to the RAM module
//SW[17] is the write enable. LEDG[0] lights up when writing is enabled
//KEY[3] is the clock
//HEX[7:6] is the address to write to
//HEX[5:4] is the data to write to the ram
//HEX[0:1] is the data being read from the ram
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

module Lab82 (SW, KEY, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
input[17:0]SW;
input[3:0]KEY;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;
output [6:0]HEX5;
output [6:0]HEX6;
output [6:0]HEX7;
output [17:0]LEDR;
output [7:0]LEDG;
reg [4:0] address;
reg [0:0] clock; 
reg [7:0] data; 
reg [0:0] wren; 
wire [7:0] outputData; 
integer dataDisplay, addressInput, dataInput;
assign LEDG[0] = SW[17];

//module ramlpm (address,clock,    data,   wren,     q);
ramlpm theRam(SW[15:11], KEY[3],	SW[7:0], SW[17],	outputData);

always@(SW or outputData) begin
	dataDisplay = outputData;
	dataInput = SW[7:0];
	addressInput = SW[15:11];
end

assign HEX0 = (dataDisplay % 10 == 0)?`ZERO: // 0
				  (dataDisplay % 10 == 1)?`ONE: // 1
				  (dataDisplay % 10 == 2)?`TWO: // 2
				  (dataDisplay % 10 == 3)?`THREE: // 3
				  (dataDisplay % 10 == 4)?`FOUR: // 4
				  (dataDisplay % 10 == 5)?`FIVE: // 5
				  (dataDisplay % 10 == 6)?`SIX: // 6
				  (dataDisplay % 10 == 7)?`SEVEN: // 7
				  (dataDisplay % 10 == 8)?`EIGHT: // 8
			     (dataDisplay % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX1 = ((dataDisplay % 100) / 10 == 0)?`ZERO: // 0
				  ((dataDisplay % 100) / 10 == 1)?`ONE: // 1
				  ((dataDisplay % 100) / 10 == 2)?`TWO: // 2
				  ((dataDisplay % 100) / 10 == 3)?`THREE: // 3
				  ((dataDisplay % 100) / 10 == 4)?`FOUR: // 4
				  ((dataDisplay % 100) / 10 == 5)?`FIVE: // 5
				  ((dataDisplay % 100) / 10 == 6)?`SIX: // 6
				  ((dataDisplay % 100) / 10 == 7)?`SEVEN: // 7
				  ((dataDisplay % 100) / 10 == 8)?`EIGHT: // 8
			     ((dataDisplay % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX2 = `BLANK;

assign HEX3 = `BLANK;
					
assign HEX4 = (dataInput % 10 == 0)?`ZERO: // 0
				  (dataInput % 10 == 1)?`ONE: // 1
				  (dataInput % 10 == 2)?`TWO: // 2
				  (dataInput % 10 == 3)?`THREE: // 3
				  (dataInput % 10 == 4)?`FOUR: // 4
				  (dataInput % 10 == 5)?`FIVE: // 5
				  (dataInput % 10 == 6)?`SIX: // 6
				  (dataInput % 10 == 7)?`SEVEN: // 7
				  (dataInput % 10 == 8)?`EIGHT: // 8
			     (dataInput % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
				
assign HEX5 = ((dataInput % 100) / 10 == 0)?`ZERO: // 0
				  ((dataInput % 100) / 10 == 1)?`ONE: // 1
				  ((dataInput % 100) / 10 == 2)?`TWO: // 2
				  ((dataInput % 100) / 10 == 3)?`THREE: // 3
				  ((dataInput % 100) / 10 == 4)?`FOUR: // 4
				  ((dataInput % 100) / 10 == 5)?`FIVE: // 5
				  ((dataInput % 100) / 10 == 6)?`SIX: // 6
				  ((dataInput % 100) / 10 == 7)?`SEVEN: // 7
				  ((dataInput % 100) / 10 == 8)?`EIGHT: // 8
			     ((dataInput % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK			
			
assign HEX6 = (addressInput % 10 == 0)?`ZERO: // 0
				  (addressInput % 10 == 1)?`ONE: // 1
				  (addressInput % 10 == 2)?`TWO: // 2
				  (addressInput % 10 == 3)?`THREE: // 3
				  (addressInput % 10 == 4)?`FOUR: // 4
				  (addressInput % 10 == 5)?`FIVE: // 5
				  (addressInput % 10 == 6)?`SIX: // 6
				  (addressInput % 10 == 7)?`SEVEN: // 7
				  (addressInput % 10 == 8)?`EIGHT: // 8
			     (addressInput % 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK
					
assign HEX7 = ((addressInput % 100) / 10 == 0)?`ZERO: // 0
				  ((addressInput % 100) / 10 == 1)?`ONE: // 1
				  ((addressInput % 100) / 10 == 2)?`TWO: // 2
				  ((addressInput % 100) / 10 == 3)?`THREE: // 3
				  ((addressInput % 100) / 10 == 4)?`FOUR: // 4
				  ((addressInput % 100) / 10 == 5)?`FIVE: // 5
				  ((addressInput % 100) / 10 == 6)?`SIX: // 6
				  ((addressInput % 100) / 10 == 7)?`SEVEN: // 7
				  ((addressInput % 100) / 10 == 8)?`EIGHT: // 8
			     ((addressInput % 100) / 10 == 9)?`NINE: // 9
				   `BLANK; // BLANK

endmodule
