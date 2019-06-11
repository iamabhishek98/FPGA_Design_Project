`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2019 23:44:47
// Design Name: 
// Module Name: frequency_calculator
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


module frequency_calculator(
    input clk_sample,
    input SW0,
    input SW5,
    input SW6,
    input [9:0] signal,
    output reg [9:0] outcross
    );
    reg [9:0] crossings = 10'b0;
    reg [9:0] even_value = 10'b0;
    reg [9:0] odd_value = 10'b0;
    reg [11:0] counter = 12'b0;
    
    initial begin crossings = 10'b0; end
       
    always @ (posedge clk_sample) begin
        counter <= counter + 1; 
        if (SW5 || SW6) begin //this voice unlock feature is enabled only when the switch is on
          if (counter == 0) begin //resets the values
              crossings <= 0;
          end
          if (counter % 2 == 0) begin 
              even_value <= signal; 
          end
          else if (counter % 2 != 0) begin 
            odd_value <= signal; 
          end
        
          if (counter > 1 && even_value > 512 && odd_value < 512) begin
            crossings <= crossings + 1;
          end
          
          if (counter == 0) begin outcross <= crossings; end
      end
      
      else if (!SW5 && !SW6) begin //to make sure everything is disabled when the switch is off
        even_value = 0;
        odd_value = 0;
        crossings = 0;  
        counter = 0;    
      end
    end
endmodule
