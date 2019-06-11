`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 10:55:57
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input CLK,
    output reg clk1
    );
    
    reg [12:0] counter;
    
    initial begin
        counter = 0;
    end
    
    always @ (posedge CLK) begin
        counter <= (counter == 2499 ? 0 : counter + 1);
        clk1 <= (counter == 2499 ? ~clk1 : clk1);
    end
endmodule
