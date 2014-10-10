//This program implements a 3 bit wide, 5:1 multiplexer. The values of SW[17:15] determine which of the SW 
//will get displayed onto the green LEDS
module Lab13 (SW, LEDR, LEDG);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
assign LEDR = SW;

//                        if true      do  :  else
//assign LEDG[7:0] = (SW[17] == 0)?SW[7:0]:SW[15:8] ;

assign LEDG[2:0] = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?SW[2:0]:
						 (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?SW[5:3]:
						 (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?SW[8:6]:
						 (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?SW[11:9]:
						 (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?SW[14:12]: 0; 
endmodule