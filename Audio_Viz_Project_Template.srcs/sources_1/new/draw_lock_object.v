`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2019 13:30:38
// Design Name: 
// Module Name: draw_lock_object
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


module draw_lock_object(
    input SW5,
    input SW6,
    input unlock_statusSW5,
    input unlock_statusSW6,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output red_object,
    output green_object
    );
    
    //wire top_lock = ((VGA_HORZ_COORD > 60) && (VGA_VERT_COORD > 20)) && ((VGA_HORZ_COORD < 80) &&  (VGA_VERT_COORD < 40)) ;
    //wire top_lock_hollow = ((VGA_HORZ_COORD > 70) && (VGA_VERT_COORD > 20)) && ((VGA_HORZ_COORD < 80) &&  (VGA_VERT_COORD < 40)) ;
    wire left_block_lock = ((VGA_HORZ_COORD > 50) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 60) &&  (VGA_VERT_COORD < 40)) ;
    wire top_block_lock = ((VGA_HORZ_COORD > 50) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 90) &&  (VGA_VERT_COORD < 20)) ;
    wire right_block_lock = ((VGA_HORZ_COORD > 80) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 90) &&  (VGA_VERT_COORD < 40)) ;
    
    wire left_block_unlock = ((VGA_HORZ_COORD > 80) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 90) &&  (VGA_VERT_COORD < 40)) ;
    wire top_block_unlock = ((VGA_HORZ_COORD > 80) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 120) &&  (VGA_VERT_COORD < 20)) ;
    wire right_block_unlock = ((VGA_HORZ_COORD > 110) && (VGA_VERT_COORD > 10)) && ((VGA_HORZ_COORD < 120) &&  (VGA_VERT_COORD < 40)) ;
   
    wire base_lock = ((VGA_HORZ_COORD > 40) && (VGA_VERT_COORD > 40)) && ((VGA_HORZ_COORD < 100) &&  (VGA_VERT_COORD < 80)) ;
    wire unlock_object = base_lock || left_block_unlock || top_block_unlock || right_block_unlock;
    wire lock_object = base_lock || left_block_lock || top_block_lock || right_block_lock;
    
    assign red_object = ((unlock_statusSW5 && SW5)||(unlock_statusSW6 && SW6)) ? 0 : (!SW5 && !SW6) ? 0 : lock_object;
    assign green_object = ((unlock_statusSW5 && SW5)||(unlock_statusSW6 && SW6)) ? (!SW5 && !SW6) ? 0 : unlock_object  : 0;
    
endmodule
