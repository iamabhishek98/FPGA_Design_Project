`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2019 01:18:31
// Design Name: 
// Module Name: intensity_shift_gen
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


module intensity_shift_gen(
    input SW5,
    input unlock_status,
    input [3:0] intensitycount,
    output [9:0] grid_shift
    );
    
    assign grid_shift = (unlock_status && SW5) ? (intensitycount*(-50) + 800) : 512; 
endmodule
