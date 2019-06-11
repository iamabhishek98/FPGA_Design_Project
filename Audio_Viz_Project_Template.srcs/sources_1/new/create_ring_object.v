`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2019 00:05:44
// Design Name: 
// Module Name: create_ring_object
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


module create_ring_object(
    input unlock_status,
    input CLK,
    input reset,
    input not_freeze,
    input [3:0] freqcount,
    input [3:0] intensity,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output ring
    );
    
    wire [20:0] r = (13-(intensity))*25;
    //wire [15:0] r = (intensity+1)*10000; 
    
    reg x_dir = 1;
    reg y_dir = 1;
    
    reg [11:0] x1=512;
    reg [11:0] y1=640;
   
    wire ften_clk;
    clk_40 rr(CLK,ften_clk);
    
    always @ (posedge ften_clk) begin
        if (reset || !unlock_status) begin
            x1 = 512;
            y1 = 640;
        end
        else begin
        
            if (x1 < r) begin
                x_dir = 1;
            end
            else if (x1 > 1023-r) begin
                x_dir = 0;
            end
            
            if (y1 < r) begin
                y_dir = 1;
            end
            else if (y1 > 1279-r) begin
                y_dir = 0;
            end
            
            
            if (x_dir && not_freeze) begin
                x1 <= x1 + 1*intensity+1;
            end
            else if (!x_dir && not_freeze) begin
                x1 <= x1 - 1*intensity-1;
            end
            
            if (y_dir && not_freeze) begin
                y1 <= y1 + 1*intensity+1;
            end
            else if (!y_dir && not_freeze) begin
                y1 <= y1 - 1*intensity-1;
            end
        end
        
    end
    
    assign ring = ((VGA_HORZ_COORD - y1)*(VGA_HORZ_COORD - y1) + (VGA_VERT_COORD - x1)*(VGA_VERT_COORD - x1) < r*r);
endmodule
