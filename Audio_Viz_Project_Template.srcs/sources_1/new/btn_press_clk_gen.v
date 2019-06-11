`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2019 11:25:29
// Design Name: 
// Module Name: btn_press_clk_gen
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
// 23.84Hz

module btn_press_clk_gen(
    input clk,
    output reg new_clk
    );
    
    reg [20:0] counter;
    
    initial begin
        counter = 0;
    end
    
    always @ (posedge clk) begin
        new_clk <= (counter == 0) ? ~new_clk : new_clk;
        counter <= counter + 1;
    end
endmodule
