`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2019 11:13:08
// Design Name: 
// Module Name: menu_text_gen
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


module menu_text_gen(
    input CLK,
    input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW15,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [8:0] res
    );

    parameter start_pos_x = 1030;
    parameter start_pos_y = 810;
    parameter increment = 20;
            
    //always @ (*) begin
     Pixel_On_Text2 #("MENU") t0(
        CLK,
        start_pos_x+85, // text position.x (top left)
        start_pos_y, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[0]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("SW0 : Freeze Waveform") t1(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[1]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW1 : Remove Waveform") t2(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 2*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[2]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW2 : Remove Ticks") t3(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 3*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[3]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW3 : Remove Gridlines") t4(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 4*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[4]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW4 : Additional Feature 1") t5(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 5*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[5]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW5 : Additional Feature 2") t6(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 6*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[6]  // result, 1 if current pixel is on text, 0 otherwise
    );
    
    Pixel_On_Text2 #("SW6 : Additional Feature 3") t7(
        CLK,
        start_pos_x, // text position.x (top left)
        start_pos_y + 7*increment, // text position.y (top left)
        VGA_HORZ_COORD, // current position.x
        VGA_VERT_COORD, // current position.y
        res[7]  // result, 1 if current pixel is on text, 0 otherwise
    );
    Pixel_On_Text2 #("SW15 : Ramp Wave") t8(
            CLK,
            start_pos_x, // text position.x (top left)
            start_pos_y + 8*increment, // text position.y (top left)
            VGA_HORZ_COORD, // current position.x
            VGA_VERT_COORD, // current position.y
            res[8]  // result, 1 if current pixel is on text, 0 otherwise
        );
//end
endmodule


