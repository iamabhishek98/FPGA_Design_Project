`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2019 15:22:57
// Design Name: 
// Module Name: unlockfeature
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


module unlockfeature(
input [3:0] freqcount,
input CLK,
input SW5,
input btnC,
output reg unlock_status
    );
    reg [6:0] ucount = 7'b0;
    
    wire rr_clk;
    clk_10 rr(CLK,rr_clk);
    
    initial begin unlock_status = 0; end 
    
    always @ (posedge rr_clk) begin
    if (freqcount == 3 && SW5) begin ucount <= ucount + 1; end
    else begin ucount <= 0; end
    if (ucount == 30 && SW5) begin unlock_status = 1; end
    else if (!SW5 || btnC) begin unlock_status = 0; end 
    end
    
endmodule
