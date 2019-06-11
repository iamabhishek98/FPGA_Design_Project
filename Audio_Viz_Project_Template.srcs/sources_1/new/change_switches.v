`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2019 12:34:55
// Design Name: 
// Module Name: change_switches
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


module change_switches(
input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW15,
input [8:0] menutext,
output [8:0] res
    );

    assign res[0] = menutext[0];
    assign res[1] = (SW0) ? menutext[1] : 0;
    assign res[2] = (SW1) ? menutext[2] : 0;
    assign res[3] = (SW2) ? menutext[3] : 0;
    assign res[4] = (SW3) ? menutext[4] : 0;
    assign res[5] = (SW4) ? menutext[5] : 0;
    assign res[6] = (SW5) ? menutext[6] : 0;
    assign res[7] = (SW6) ? menutext[7] : 0;
    assign res[8] = (SW15) ? menutext[8] : 0; 
    

    
endmodule
