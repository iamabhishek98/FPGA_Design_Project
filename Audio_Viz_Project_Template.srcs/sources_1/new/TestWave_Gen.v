`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 10:42:31
// Design Name: 
// Module Name: TestWave_Gen
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


module TestWave_Gen(
    input clock,
    output reg [9:0] ramp_sample
    );
    
    initial begin
        ramp_sample = 0;
    end
    
    always @ (posedge clock) begin
        ramp_sample <= (ramp_sample == 639) ? 0 : ramp_sample + 1;
    end
endmodule
