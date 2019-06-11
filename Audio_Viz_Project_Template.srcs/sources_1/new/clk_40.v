`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 22:22:33
// Design Name: 
// Module Name: clk_40
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


module clk_40(
  input CLK,
output reg clk1
);

reg [22:0] counter;

initial begin
   counter = 0;
end

always @ (posedge CLK) begin
   counter <= (counter == 150000 ? 0 : counter + 1);
   clk1 <= (counter == 150000 ? ~clk1 : clk1);
end
endmodule
