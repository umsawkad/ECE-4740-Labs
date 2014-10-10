//This program displays the morse code of the letters A-H, denoted by SW[2:0] onto the LEDR's. 
//KEY[3] starts the display of the morse code for the inputted letter
//KEY[0] resets the program
`define BLANK 7'b1111111
`define LETTER_A 7'b0001000 // • —          0
`define LETTER_B 7'b0000000 // — • • •      1
`define LETTER_C 7'b1000110 // — • — •      2
`define LETTER_D 7'b1000000 // — • •        3
`define LETTER_E 7'b0000110 // •            4
`define LETTER_F 7'b0001110 // • • — •      5
`define LETTER_G 7'b1000010 // — — •        6
`define LETTER_H 7'b0001001 // • • • •      7

module Lab54 (HEX0, CLOCK_50, LEDR, SW, KEY);
output [6:0]HEX0;
output[17:0]LEDR;
input [3:0]KEY;
input[17:0]SW;
input CLOCK_50;
wire [25:0]width;
integer letterToDisplay;
integer pause[3:0];
reg keepLightsOn;
reg Lights;

assign LEDR = Lights;

LPMCOUNTER26BIT myCounter(CLOCK_50, 1, ~KEY[0], width);
	
always @(posedge width[23] or negedge KEY[0] or negedge KEY[3]) begin 
	
	if (~KEY[3])begin
		letterToDisplay = SW[2:0];
		
		if (letterToDisplay == 'd0)begin 
			pause[0] = 1; pause[1] = 3; pause[2] = 0; pause[3] = 0; // A
		end
		if (letterToDisplay == 'd1)begin 
			pause[0] = 3; pause[1] = 1; pause[2] = 1; pause[3] = 1; // B
		end
		if (letterToDisplay == 'd2)begin 
			pause[0] = 3; pause[1] = 1; pause[2] = 3; pause[3] = 1; // C
		end
		if (letterToDisplay == 'd3)begin 
			pause[0] = 3; pause[1] = 1; pause[2] = 1; pause[3] = 0; // D
		end
		if (letterToDisplay == 'd4)begin 
			pause[0] = 1; pause[1] = 0; pause[2] = 0; pause[3] = 0; // E
		end
		if (letterToDisplay == 'd5)begin 
			pause[0] = 1; pause[1] = 1; pause[2] = 3; pause[3] = 1; // F
		end
		if (letterToDisplay == 'd6)begin 
			pause[0] = 3; pause[1] = 3; pause[2] = 1; pause[3] = 0; // G
		end
		if (letterToDisplay == 'd7)begin 
			pause[0] = 1; pause[1] = 1; pause[2] = 1; pause[3] = 1; // H
		end
		Lights <= 0;
	end
	else if (~KEY[0]) begin // reset

	end
	else begin
		if (LEDR && ~keepLightsOn) begin
			Lights <= 0;
		end
		else if (pause[0] > 0) begin
			Lights <= 1;
			pause[0] = pause[0] - 1;
			if (pause[0] > 0)
				keepLightsOn <= 1;
			else
				keepLightsOn <= 0;
		end
		else if (pause[1] > 0) begin
			Lights <= 1;
			pause[1] = pause[1] - 1;
			if (pause[1] > 0)
				keepLightsOn <= 1;
			else
				keepLightsOn <= 0;
		end	
		else if (pause[2] > 0) begin
			Lights <= 1;
			pause[2] = pause[2] - 1;
			if (pause[2] > 0)
				keepLightsOn <= 1;
			else
				keepLightsOn <= 0;
		end
		else if (pause[3] > 0) begin
			Lights <= 1;
			pause[3] = pause[3] - 1;
			if (pause[3] > 0)
				keepLightsOn <= 1;
			else
				keepLightsOn <= 0;
		end		
			
			
	//letterToDisplay = letterToDisplay + 1;
	//if (letterToDisplay >= 8)
	//	letterToDisplay = 0;
	/*if (~KEY[1])begin
	end
	else if (~KEY[0]) begin

	end
	else begin
*/
	end
end

assign HEX0 = (letterToDisplay % 10 == 0)?`LETTER_A: // 0
				  (letterToDisplay % 10 == 1)?`LETTER_B: // 1
				  (letterToDisplay % 10 == 2)?`LETTER_C: // 2
				  (letterToDisplay % 10 == 3)?`LETTER_D: // 3
				  (letterToDisplay % 10 == 4)?`LETTER_E: // 4
				  (letterToDisplay % 10 == 5)?`LETTER_F: // 5
				  (letterToDisplay % 10 == 6)?`LETTER_G: // 6
				  (letterToDisplay % 10 == 7)?`LETTER_H: // 7
				   `BLANK; // BLANK
endmodule
