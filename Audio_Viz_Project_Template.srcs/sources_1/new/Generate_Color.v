`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 11:46:52
// Design Name: 
// Module Name: Generate_Color
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


module Generate_Color(
    input CLK,
    input unlock_statusSW6,
    input btnL,
    input btnR,
    input unlock_statusSW5, 
    input [3:0] freqcount,
    input [3:0] intensity, //
    output reg [11:0] color,
    output reg [2:0] counter,
    output reg [11:0] intensity_color
    );
    
    // red, orange, pink, purple, blue, cyan, dark green, green, yellow
    reg [119:0] freqcolor = 120'h00f39ff0ff06f00ff09900f00fffff;
    reg [11:0] curr_freqcolor = 12'hfff;
    
    initial begin
        counter = 0;
        intensity_color = 12'h000;
    end
    
    always @ (posedge CLK) begin
        counter <= (btnL == 1 && counter == 0) ? 3'b100 : (btnL == 1 && counter > 0) ? (counter - 1)%5 : (btnR == 1) ? (counter + 1)%5 : counter%5;
        
        case(freqcount)
        1: curr_freqcolor <= freqcolor[11:0];
        2: curr_freqcolor <= freqcolor[23:12];
        3: curr_freqcolor <= freqcolor[35:24];
        4: curr_freqcolor <= freqcolor[47:36];
        5: curr_freqcolor <= freqcolor[59:48];
        6: curr_freqcolor <= freqcolor[71:60];
        7: curr_freqcolor <= freqcolor[83:72];
        8: curr_freqcolor <= freqcolor[95:84];
        9: curr_freqcolor <= freqcolor[107:96];
        10: curr_freqcolor <= freqcolor[119:108];
        endcase
        
        case (counter)
        3'b000: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        3'b001: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        3'b010: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        3'b011: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        3'b100: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        default: color <= (unlock_statusSW5 || unlock_statusSW6) ? curr_freqcolor : 12'hfff;
        endcase
        
        case (intensity) 
        0: intensity_color <= 12'h000;
        1: intensity_color <= 12'h0ef;
        2: intensity_color <= 12'h0ef;
        3: intensity_color <= 12'h0cf;
        4: intensity_color <= 12'h0cf;
        5: intensity_color <= 12'h0af;
        6: intensity_color <= 12'h0af;
        7: intensity_color <= 12'h39f;
        8: intensity_color <= 12'h39f;
        9: intensity_color <= 12'h05f;
        10: intensity_color <= 12'h05f;
        11: intensity_color <= 12'h00f;
        12: intensity_color <= 12'h00f;
        default: intensity_color <= 12'h000;
        endcase
    end
endmodule
