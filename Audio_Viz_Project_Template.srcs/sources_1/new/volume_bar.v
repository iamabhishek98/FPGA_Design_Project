`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2019 00:40:09
// Design Name: 
// Module Name: volume_bar
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


module volume_bar(
input [11:0] VGA_HORZ_COORD,
input [11:0] VGA_VERT_COORD,
input [3:0] count,
output reg [5:0] intensity
    );
   // wire [5:0] intensity; 
    parameter x = 140;
    parameter y = 930;
    parameter shift = 60;
    
    always @ (*) begin 
        case (count) 
            0: begin 
                intensity [5:0] = 6'b0;
            end
            1: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5:1] = 5'b0;        
            end
            2: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5:1] = 5'b0;        
            end
            3: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5:2] = 4'b0;   
            end
            4: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5:2] = 4'b0;   
            end
            5: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity [5:3] = 3'b0;    
            end
            6: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity [5:3] = 3'b0;    
            end
            7: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity [5:4] = 2'b0;         
            end
            8: begin 
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity [5:4] = 2'b0;         
            end
            9: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[4] = ((VGA_HORZ_COORD > x+shift*4) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*5) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5] = 0;    
            end
            10: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[4] = ((VGA_HORZ_COORD > x+shift*4) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*5) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5] = 0;    
            end
            11: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[4] = ((VGA_HORZ_COORD > x+shift*4) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*5) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5] = ((VGA_HORZ_COORD > x+shift*5) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*6) &&  (VGA_VERT_COORD < y+shift)) ;
            end
            12: begin
                intensity[0] = ((VGA_HORZ_COORD > x) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[1] = ((VGA_HORZ_COORD > x+shift) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*2) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[2] = ((VGA_HORZ_COORD > x+shift*2) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*3) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[3] = ((VGA_HORZ_COORD > x+shift*3) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*4) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[4] = ((VGA_HORZ_COORD > x+shift*4) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*5) &&  (VGA_VERT_COORD < y+shift)) ;
                intensity[5] = ((VGA_HORZ_COORD > x+shift*5) && (VGA_VERT_COORD > y)) && ((VGA_HORZ_COORD < x+shift*6) &&  (VGA_VERT_COORD < y+shift)) ;
            end         
        endcase
    end
    
    
endmodule
