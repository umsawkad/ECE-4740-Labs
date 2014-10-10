//This program is a simple multiplexer that displays the SW[7:0], or the SW[15:8] values on the green LED's,
//depending on the position of SW[17] 
module Lab12 (SW, LEDR, LEDG);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
assign LEDR = SW;
assign LEDG[7:0] = (SW[17] == 0 )?SW[7:0]:SW[15:8] ; 
endmodule