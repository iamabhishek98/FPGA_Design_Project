`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 01:25:23
// Design Name: 
// Module Name: sine
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


module sine(
    input CLK,
    input [3:0] freqcount,
    output reg [15:0] sine_val 
    );
    
    always @ (posedge CLK) begin
        case(freqcount)
        0: sine_val <= 0;
        1: sine_val <= 0.5877852;
        2: sine_val <= 0.9510565163;
        3: sine_val <= 0.9510565163;
        4: sine_val <= 0.5877852;
        5: sine_val <= 0;
        6: sine_val <= -0.5877852;
        7: sine_val <= -0.9510565163;
        8: sine_val <= -0.9510565163;
        9: sine_val <= -0.5877852;
        endcase
    end
endmodule
