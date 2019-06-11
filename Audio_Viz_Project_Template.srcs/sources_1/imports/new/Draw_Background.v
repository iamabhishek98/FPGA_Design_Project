`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------  
//                  DRAWING GRID LINES AND TICKS ON SCREEN
// Description:
// Grid lines are drawn at pixel # 320 along the x-axis, and
// pixel #768 along the y-axis

// Note the VGA controller is configured to produce a 1024 x 1280 pixel resolution
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// TOOD:    Draw grid lines at every 80-th pixel along the horizontal axis, and every 64th pixel
//          along the vertical axis. This gives us a 16x16 grid on screen. 
//          
//          Further draw ticks on the central x and y grid lines spaced 16 and 8 pixels apart in the 
//          horizontal and vertical directions respectively. This gives us 5 sub-divisions per division 
//          in the horizontal and 8 sub-divisions per divsion in the vertical direction   
//-------------------------------------------------------------------------  
  
//////////////////////////////////////////////////////////////////////////////////


module Draw_Background(
    input SW2,
    input SW3,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input [2:0] color_selector,
    input [9:0] grid_shift,
    input unlock_status,
    input lock_object_red,
    input unlock_object_green,
    input [8:0] menu_text,
    input volumetext,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    
// The code below draws two grid lines. Modify the codes to draw more grid lines.
    wire Condition_For_Grid = !SW3 && ((VGA_HORZ_COORD == 640) ||  (VGA_VERT_COORD == grid_shift)); 
    
    wire Condition_For_Grid_Lines = !SW3 && (((VGA_HORZ_COORD % 80 == 0) && (VGA_VERT_COORD % 16 == 0)) || ((VGA_HORZ_COORD % 16 == 0) &&  (VGA_VERT_COORD % 64 == 0))) ;


// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    parameter x_tick_width = 10;
    parameter y_tick_width = 5;
    wire Condition_For_Ticks =  !SW2 && (((VGA_HORZ_COORD % 80 == 0) && (VGA_VERT_COORD > grid_shift - 2*x_tick_width ) && (VGA_VERT_COORD < grid_shift + 2*x_tick_width )) ||
                                ((VGA_HORZ_COORD % 16 == 0) &&  (VGA_VERT_COORD > grid_shift - x_tick_width ) && (VGA_VERT_COORD < grid_shift + x_tick_width )) || 
                                ((VGA_VERT_COORD % 64 == 0) && (VGA_HORZ_COORD > 640 - 2*y_tick_width) && (VGA_HORZ_COORD < 640 + 2*y_tick_width)) ||
                                ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD > 640 - y_tick_width) && (VGA_HORZ_COORD < 640 + y_tick_width)));

    wire menu_box_top = ((VGA_HORZ_COORD > 1020) && (VGA_HORZ_COORD < 1250) && (VGA_VERT_COORD == 805));
    wire menu_box_bottom = ((VGA_HORZ_COORD > 1020) && (VGA_HORZ_COORD < 1250) && (VGA_VERT_COORD == 990));
    wire menu_box_left = ((VGA_HORZ_COORD == 1020) && (VGA_VERT_COORD >= 805) && (VGA_VERT_COORD <= 990));
    wire menu_box_right = ((VGA_HORZ_COORD == 1250) && (VGA_VERT_COORD >= 805) && (VGA_VERT_COORD <= 990));
    wire menu_box_menu_line = ((VGA_HORZ_COORD > 1020) && (VGA_HORZ_COORD < 1250) && (VGA_VERT_COORD == 825));
    
    
    wire volumebox_top = ((VGA_HORZ_COORD >= 140) && (VGA_HORZ_COORD <= 500) && (VGA_VERT_COORD == 930));
    wire volumebox_bottom = ((VGA_HORZ_COORD >= 140) && (VGA_HORZ_COORD <= 500) && (VGA_VERT_COORD == 990)); 
    wire volumebox_left = ((VGA_VERT_COORD >= 930) && (VGA_VERT_COORD <= 990) && (VGA_HORZ_COORD == 140)); 
    wire volumebox_right = ((VGA_VERT_COORD >= 930) && (VGA_VERT_COORD <= 990) && (VGA_HORZ_COORD == 500)); 
            
    wire volume_box = volumebox_top || volumebox_bottom || volumebox_left || volumebox_right;
    
    wire menu_box = menu_box_top || menu_box_left || menu_box_right || menu_box_bottom || menu_box_menu_line;
    
// Please modify below codes to change the background color and to display ticks defined above
    assign VGA_Red_Grid = menu_box || menu_text || volumetext || volume_box || (lock_object_red) || (color_selector == 0 && Condition_For_Grid) || (color_selector == 1 && Condition_For_Grid_Lines)
                          || (color_selector == 2 && Condition_For_Grid) || (color_selector == 3 && Condition_For_Ticks) ? 4'hf : (color_selector >= 4) ? 4'h6 : 4'h0;
    
    assign VGA_Green_Grid = menu_box || menu_text || volumetext || volume_box || (unlock_object_green) || (color_selector == 0 && Condition_For_Grid_Lines) || (color_selector == 1 && Condition_For_Ticks)
                          || (color_selector == 2 && Condition_For_Ticks) || (color_selector == 3 && (Condition_For_Grid || Condition_For_Grid_Lines))
                          || (color_selector == 4 && (Condition_For_Grid || Condition_For_Grid_Lines || Condition_For_Ticks)) ? 4'hf : (color_selector == 3) ? 4'h0: 4'h0;
                                                    
    assign VGA_Blue_Grid = menu_box || menu_text  || volumetext || volume_box || (color_selector == 0 && Condition_For_Ticks) || (color_selector == 1 && Condition_For_Grid)
                          || (color_selector == 2 && Condition_For_Grid_Lines) || (color_selector == 3 && Condition_For_Grid_Lines)
                          || (color_selector == 4 &&(Condition_For_Ticks || Condition_For_Grid_Lines)) ? 4'hf : (color_selector >= 3) ? 4'h6 : 4'h0;
endmodule
