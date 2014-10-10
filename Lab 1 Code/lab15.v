//This program uses a 3 bit wide multiplexer to display letters onto the HEX displays. Using SW[17:15], the 
//letters denoted by SW[14:12], SW[11, 9], SW[8, 6], SW[5, 3], and SW[2, 0] can be rotated on the displays.
//by counting in binary with SW[17:15]
module Lab15 (SW, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3, HEX4);
input [17:0]SW;
output [17:0]LEDR;
output [7:0]LEDG;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;
output [6:0]HEX4;

wire [6:0]letter0;
wire [6:0]letter1;
wire [6:0]letter2;
wire [6:0]letter3;
wire [6:0]letter4;
assign LEDR = SW;

//                        if true      do  :  else
//assign LEDG[7:0] = (SW[17] == 0)?SW[7:0]:SW[15:8] ;

assign letter0 = (SW[2] == 0  && SW[1] == 0 && SW[0] == 0)?7'b0001001:  // H
				  (SW[2] == 0  && SW[1] == 0 && SW[0] == 1)?7'b0000110:  // E
				  (SW[2] == 0  && SW[1] == 1 && SW[0] == 0)?7'b1000111:  // L
				  (SW[2] == 0  && SW[1] == 1 && SW[0] == 1)?7'b1000000: // O
				   7'b1111111; 
assign letter1 = (SW[5] == 0  && SW[4] == 0 && SW[3] == 0)?7'b0001001:  // H
				  (SW[5] == 0  && SW[4] == 0 && SW[3] == 1)?7'b0000110:  // E
				  (SW[5] == 0  && SW[4] == 1 && SW[3] == 0)?7'b1000111:  // L
				  (SW[5] == 0  && SW[4] == 1 && SW[3] == 1)?7'b1000000: // O
				   7'b1111111; 
assign letter2 = (SW[8] == 0  && SW[7] == 0 && SW[6] == 0)?7'b0001001:  // H
				  (SW[8] == 0  && SW[7] == 0 && SW[6] == 1)?7'b0000110:  // E
				  (SW[8] == 0  && SW[7] == 1 && SW[6] == 0)?7'b1000111:  // L
				  (SW[8] == 0  && SW[7] == 1 && SW[6] == 1)?7'b1000000: // O
				   7'b1111111; 
assign letter3 = (SW[11] == 0  && SW[10] == 0 && SW[9] == 0)?7'b0001001:  // H
				  (SW[11] == 0  && SW[10] == 0 && SW[9] == 1)?7'b0000110:  // E
				  (SW[11] == 0  && SW[10] == 1 && SW[9] == 0)?7'b1000111:  // L
				  (SW[11] == 0  && SW[10] == 1 && SW[9] == 1)?7'b1000000: // O
				   7'b1111111; 
assign letter4 = (SW[14] == 0  && SW[13] == 0 && SW[12] == 0)?7'b0001001:  // H
				  (SW[14] == 0  && SW[13] == 0 && SW[12] == 1)?7'b0000110:  // E
				  (SW[14] == 0  && SW[13] == 1 && SW[12] == 0)?7'b1000111:  // L
				  (SW[14] == 0  && SW[13] == 1 && SW[12] == 1)?7'b1000000: // O
				   7'b1111111; 

assign HEX0 = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?letter0: 
				  (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?letter4: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?letter3: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?letter2: 
				  (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?letter1: 
				   7'b1111111; 
					
assign HEX1 = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?letter1: 
				  (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?letter0: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?letter4: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?letter3: 
				  (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?letter2: 
				   7'b1111111; 
					
assign HEX2 = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?letter2: 
				  (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?letter1: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?letter0: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?letter4: 
				  (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?letter3:
			  	   7'b1111111; 
				  
assign HEX3 = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?letter3: 
				  (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?letter2: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?letter1: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?letter0: 
				  (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?letter4:
				   7'b1111111; 
				  
assign HEX4 = (SW[17] == 0  && SW[16] == 0 && SW[15] == 0)?letter4: 
				  (SW[17] == 0  && SW[16] == 0 && SW[15] == 1)?letter3: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 0)?letter2: 
				  (SW[17] == 0  && SW[16] == 1 && SW[15] == 1)?letter1: 
				  (SW[17] == 1  && SW[16] == 0 && SW[15] == 0)?letter0:
				   7'b1111111; 
			
endmodule