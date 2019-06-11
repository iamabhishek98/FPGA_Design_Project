`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2019 17:09:42
// Design Name: 
// Module Name: dflipflop
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


module dflipflop(
    input clk,
    input btn_state,
    output reg btn_press
    );
    
    initial begin
        btn_press = 0;
    end
    
    always @ (posedge clk) begin
        btn_press <= btn_state;
    end
    
endmodule
