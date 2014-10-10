//This program displays the 3 bit value of SW[2:0] onto HEX0
module Lab14 (SW, LEDR, LEDG, HEX0);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
output [6:0]HEX0;
assign LEDR = SW;

//                        if true      do  :  else
//assign LEDG[7:0] = (SW[17] == 0)?SW[7:0]:SW[15:8] ;

assign HEX0 = (SW[2] == 0  && SW[1] == 0 && SW[0] == 0)?7'b0001001:  // H
				  (SW[2] == 0  && SW[1] == 0 && SW[0] == 1)?7'b0000110:  // E
				  (SW[2] == 0  && SW[1] == 1 && SW[0] == 0)?7'b1000111:  // L
				  (SW[2] == 0  && SW[1] == 1 && SW[0] == 1)?7'b1000000: // O
				   7'b1111111; 	
endmodule