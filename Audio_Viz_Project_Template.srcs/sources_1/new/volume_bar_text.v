`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 02:35:56
// Design Name: 
// Module Name: volume_bar_text
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


module volume_bar_text(
    input CLK,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [12:0] text  
    );

    parameter x = 280;
    parameter y = 950;
    Pixel_On_Text2 #("Volume: 0") t1(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[0]  // result, 1 if current pixel is on text, 0 otherwise
    );

    Pixel_On_Text2 #("Volume: 1") t2(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[1]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 2") t3(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[2]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 3") t4(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[3]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 4") t5(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[4]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 5") t6(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[5]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 6") t7(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[6]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 7") t8(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[7]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 8") t9(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[8]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 9") t10(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[9]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 10") t11(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[10]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 11") t12(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[11]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("Volume: 12") t13(
        CLK,
        x, // text position.x (top left)
        y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        text[12]  // result, 1 if current pixel is on text, 0 otherwise
    );

    
endmodule
