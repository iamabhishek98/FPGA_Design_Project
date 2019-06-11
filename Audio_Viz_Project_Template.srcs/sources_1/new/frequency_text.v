`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2019 01:09:29
// Design Name: 
// Module Name: frequency_text
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
// text library credit to Derek X Wang
// https://github.com/Derek-X-Wang/VGA-Text-Generator/tree/master/VGA-Text-Generator.srcs/sources_1/new
//////////////////////////////////////////////////////////////////////////////////


module frequency_text(
    input CLK,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [9:0] res
    );
        
    parameter start_pos_x = 255;
    parameter start_pos_y = 900;
    
    Pixel_On_Text2 #("Frequency: < 300 Hz") t0(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[0]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Frequency: 300 Hz") t1(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[1]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 400 Hz") t2(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[2]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 500 Hz") t3(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[3]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 600 Hz") t4(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[4]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 700 Hz") t5(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[5]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 800 Hz") t6(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[6]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 900 Hz") t7(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[7]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: 1000 Hz") t8(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[8]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("Frequency: > 1000 Hz") t9(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[9]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    
    
endmodule
