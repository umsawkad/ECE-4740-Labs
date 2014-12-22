//This program uses SRAM to replicate the results in Lab82 and Lab83. The only issue with this implementation is that the data can still be written one time after SW[17] is brought low
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

module Lab84 (SW, KEY, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, SRAM_UB_N, SRAM_DQ, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N, SRAM_ADDR);
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
output [0:0]LEDG;
output [17:0]LEDR;

output SRAM_UB_N;
inout [15:0]SRAM_DQ;
output SRAM_LB_N;
output SRAM_WE_N;
output SRAM_CE_N;
output SRAM_OE_N;
output [17:0]SRAM_ADDR;

wire [7:0] dataIn;
wire [7:0] dataOut;
wire [4:0] address;
wire WREN, Clock;

assign SRAM_UB_N = 0;
assign SRAM_DQ[15:8] = 8'b00000000;
assign SRAM_LB_N = 0;
assign SRAM_CE_N = 0;
assign SRAM_OE_N = 0;
assign SRAM_ADDR[17:5] = 13'b0000000000000;
assign SRAM_WE_N = ~WREN;
assign SRAM_DQ[7:0] = WREN ? dataIn : 8'bZ ;
assign dataOut = SRAM_DQ[7:0];
assign SRAM_ADDR = address;

assign dataIn = SW[7:0];
assign WREN = SW[17];
assign Clock = KEY[3];
assign address = SW[15:11];
assign LEDR[7:0] = dataOut;
assign LEDG[0] = WREN;

integer dataDisplay, addressInput, dataInput;

always@(posedge KEY[3]) begin
	dataDisplay = dataOut;
end

always@(SW) begin
	addressInput = address;
	dataInput = dataIn;
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
