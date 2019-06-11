`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 04:31:47
// Design Name: 
// Module Name: unlockfeaturesw62
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


module unlockfeaturesw62(
input [3:0] freqcount,
input CLK,
input SW6,
input btnC,
input unlock_700,
output reg unlock_status
    );
    reg [6:0] ucount = 7'b0;
    
    wire rr_clk;
    clk_10 rr(CLK,rr_clk);
    
    initial begin unlock_status = 0; end 
    
    always @ (posedge rr_clk) begin
    if (freqcount == 8 && SW6 && unlock_700) begin ucount <= ucount + 1; end
    else begin ucount <= 0; end
    if (ucount == 30 && SW6 && unlock_700) begin unlock_status = 1; end
    else if (!unlock_700) begin unlock_status = 0; end 
    end
    
endmodule
