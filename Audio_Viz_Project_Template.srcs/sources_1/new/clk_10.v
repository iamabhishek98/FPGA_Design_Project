`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 09:50:36
// Design Name: 
// Module Name: clk_10
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_10(
   input CLK,
 output reg clk1
 );
 
 reg [22:0] counter;
 
 initial begin
     counter = 0;
 end
 
 always @ (posedge CLK) begin
     counter <= (counter == 5000000 ? 0 : counter + 1);
     clk1 <= (counter == 5000000 ? ~clk1 : clk1);
 end
 endmodule
