`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// You may study and modify the code inside this module to imporve the display feature or introduce other features
//////////////////////////////////////////////////////////////////////////////////

module Draw_Waveform(
    input clk_sample, //20kHz clock
    input SW0,
    input SW1,
    input SW4,
    input SW5,
    input SW6,
    input [11:0] color,
    input ring,
    input sphere,
    input unlockfeatureSW62,
    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input [9:0] maxsignal,
    input [9:0] grid_shift,
    input freq_text,
    output [3:0] VGA_Red_waveform,
    output [3:0] VGA_Green_waveform,
    output [3:0] VGA_Blue_waveform
    );
    
    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 
    reg [9:0] Sample_Memory[1279:0];
    reg [10:0] i = 0;
    
    //Each wave_sample is displayed on the screen from left to right. 
    always @ (posedge clk_sample) begin
        i = (i==1279) ? 0 : i + 1;
        Sample_Memory[i] <= (SW0 == 1) ? Sample_Memory[i] : wave_sample;              
    end
     
    wire draw_point = (!SW1 && ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (512 + grid_shift - Sample_Memory[VGA_HORZ_COORD]))));
    wire draw_lines = (!SW1 && (!((VGA_HORZ_COORD < 1280) && ((VGA_VERT_COORD < grid_shift) && (VGA_VERT_COORD < (512 + grid_shift - Sample_Memory[VGA_HORZ_COORD]))))) && (VGA_VERT_COORD < grid_shift));
    wire draw_max_line = !SW1 && SW0 && (VGA_HORZ_COORD < 1280 && VGA_VERT_COORD == (512 + grid_shift - maxsignal));
    wire draw_wave = ((SW5 || SW6) && freq_text) || (unlockfeatureSW62 ? sphere : (SW6 ? ring : (draw_max_line || (SW4 ? draw_lines : draw_point))));

    assign VGA_Red_waveform =  draw_wave  ? color[3:0] : 0;
    assign VGA_Green_waveform = draw_wave ? color[7:4] : 0;
    assign VGA_Blue_waveform =  draw_wave ? color[11:8] : 0;

    
endmodule
