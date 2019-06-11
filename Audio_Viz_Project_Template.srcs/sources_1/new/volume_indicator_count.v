`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2019 22:58:48
// Design Name: 
// Module Name: volume_indicator_count
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


module volume_indicator_count(
input rr_clk,
input SW0,
input [11:0] signal,
output reg [3:0] count
    );
     initial begin
     count = 4'b0;
     end
     
     always @ (posedge rr_clk) begin
      if (SW0) begin 
      count <= count; 
      end
      else if (signal<=2150) begin 
      count = 0;
      end
      
      else if (signal<=2300) begin 
      count = 1;
      end
   
      else if (signal<=2450) begin 
      count = 2;
      end
      
      else if (signal<=2600) begin 
      count = 3;
      end
      
      else if (signal<=2750) begin 
      count = 4;
      end
   
      else if (signal<=2900) begin 
      count = 5;
      end
      
      else if (signal<=3050) begin 
      count = 6;
      end   
   
      else if (signal<=3200) begin 
      count = 7;
      end
      
      else if (signal<=3350) begin 
      count = 8;
      end
      
      else if (signal<=3550) begin 
      count = 9;
      end
      
      else if (signal<=3750) begin 
      count = 10;
      end
      
      else if (signal<=3900) begin 
      count = 11;
      end
      
      else if (signal>3900) begin 
      count = 12;
      end
      
      end
     
endmodule
