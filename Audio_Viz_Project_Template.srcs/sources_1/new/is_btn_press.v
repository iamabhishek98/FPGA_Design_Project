`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 17:14:30
// Design Name: 
// Module Name: is_btn_press
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


module is_btn_press(
    input clk,
    input btn_state,
    output btn_press
    );
    
    wire out1, out2;
    
    dflipflop dff1(clk, btn_state, out1);
    dflipflop dff2(clk, out1, out2);
    assign btn_press = out1 & ~out2;
endmodule
