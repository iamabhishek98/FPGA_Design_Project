`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 19:04:22
// Design Name: 
// Module Name: displayfreqcount
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


module displayfreqcount(
input CLK,
input SW0,
input SW5,
input SW6,
input [9:0] crossings,
output reg [3:0] count
    );
    wire rr_clk;
    clk_10 rr(CLK,rr_clk);
    
    initial begin count = 1; end
    
    always @ (posedge rr_clk) begin
        if ((SW5&&!SW0)||(SW6&&!SW0)) begin
            //if ( (!SW5 && !SW6)) begin count = 1; end
            if (crossings<48) begin count = 1; end //means below 300 display ---
            else if (crossings<72) begin count = 2; end //means above 300 
            else if (crossings<87) begin count = 3; end //means above 400 360 370-410 420
            else if (crossings<108) begin count = 4; end //means above 500 440 470-490 520 
            else if (crossings<132) begin count = 5; end //means above 600 560 570-590 630 
            else if (crossings<156) begin count = 6; end //means above 700 650 670-690 730
            else if (crossings<174) begin count = 7; end //means above 800 770 790 810
            else if (crossings<191) begin count = 8; end //means above 900 840 870-880 910
            else if (crossings<210) begin count = 9; end //means above 1000 960 970-980 1010
            else begin count = 10; end
        end

        if (!SW5 && !SW6) begin count = 1; end
       
    end    
    
endmodule
