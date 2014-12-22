//This program uses an lpm module for extra ram
//SW[0] is an active low synchronous reset
//SW[1] is the input to the FSM emulator
//KEY[0] is the clock
module Lab81 (SW, outputData);
input[17:0]SW;

reg [4:0] address;
reg [0:0] clock; 
reg [7:0] data; 
reg [0:0] wren; 
output wire [7:0] outputData; 

ramlpm theRam(SW[4:0], SW[17],	SW[15:8], SW[16],	outputData);

always @(posedge SW[0]) begin


end

endmodule
