`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// National University of Singapore
// Department of Electrical and Computer Engineering
// EE2026 Digital Design
// AY1819 Semester 1
// Project: Voice Scope
//////////////////////////////////////////////////////////////////////////////////

module Voice_Scope_TOP(
    input CLK,
    input SW0,
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    input SW5,
    input SW6,
    input SW15,
    
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
    
    input  J_MIC3_Pin3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_Pin1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_Pin4,   // PmodMIC3 serial clock (generated by module VoiceCapturer.v)
   
    output [3:0] VGA_RED,    // RGB outputs to VGA connector (4 bits per channel gives 4096 possible colors)
    output [3:0] VGA_GREEN,
    output [3:0] VGA_BLUE,
    
    output VGA_VS,          // horizontal & vertical sync outputs to VGA connector
    output VGA_HS,
    output [12:0] LED,
    output [7:0] SEVEN_SEG,
    output [3:0] DISPLAY
    );
       
    wire [3:0] VGA_Red_waveform;
    wire [3:0] VGA_Green_waveform;
    wire [3:0] VGA_Blue_waveform;
    wire [9:0] wave_sample;
    
    wire [11:0] VGA_HORZ_COORD;
    wire [11:0] VGA_VERT_COORD;
    
    wire [3:0] VGA_Red_grid;
    wire [3:0] VGA_Green_grid;
    wire [3:0] VGA_Blue_grid;
    
    wire [9:0] test_wave;  
       
//-----------------------------------------------------------------------------
//                  STUDENT A - MIC
//-----------------------------------------------------------------------------

       
       
    
// Please create a clock divider module to generate a 20kHz clock signal. 
// Create a button press detector
wire clk1, btn_clk, btnL_press, btnR_press;
clk_div clk_20(CLK, clk1);
btn_press_clk_gen bpcg(CLK, btn_clk); 

is_btn_press b1(btn_clk, btnL, btnL_press);
is_btn_press b2(btn_clk, btnR, btnR_press);   

       
// Please instantiate the voice capturer module below
   wire [11:0]sample;
TestWave_Gen testwave_gen(clk1, test_wave);
Voice_Capturer(CLK, clk1, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, sample);

wire unlock_statusSW5; //0 means locked and 1 means unlocked 
//using SW5 as the switch to unlock this feature
wire unlock_statusSW6;
wire unlock_statusSW62;
wire [9:0] crossings;

 frequency_calculator fc(clk1, SW0, SW5, SW6, wave_sample, crossings);
 wire [3:0] freqcount; 
 displayfreqcount dfc(CLK,SW0,SW5,SW6,crossings,freqcount);
 unlockfeature ufsw5(freqcount,CLK,SW5,btnC,unlock_statusSW5); //400 hz
 unlock_featureSW6 ufsw6(freqcount,CLK,SW6,btnC,unlock_statusSW6); //700 hz
 unlockfeaturesw62 ufsw62(freqcount,CLK,SW6,btnC,unlock_statusSW6,unlock_statusSW62);
 wire [11:0] maxsignal; wire [3:0] intensitycount;
 volume_indicator vi(freqcount,CLK,clk1,sample,SW0,SW5,SW6,SW15,LED,SEVEN_SEG,DISPLAY,maxsignal,intensitycount); 
 
 wire [9:0] grid_shift;
 
 wire red_lock_object, green_unlock_object;
 
 intensity_shift_gen isg(SW5, unlock_statusSW5, intensitycount, grid_shift);
 
 draw_lock_object dlosw5(SW5, SW6, unlock_statusSW5, unlock_statusSW6, VGA_HORZ_COORD, VGA_VERT_COORD, red_lock_object, green_unlock_object);
 
assign wave_sample = (!SW15) ? sample[11:2] : test_wave[9:0];

//-----------------------------------------------------------------------------
//                  STUDENT B - VGA
//-----------------------------------------------------------------------------
 
    
// Please instantiate the waveform drawer module below
    
       
   wire [11:0] color; 
   wire [2:0] color_selector;
   wire ring;
   wire CLK_VGA;
   wire [9:0] freq_text;
   wire [8:0] menu_text;
   wire [11:0] intensity_color; 
   wire [12:0] intensity_barnumber;
       
   volume_bar_text vbt(CLK_VGA, VGA_HORZ_COORD, VGA_VERT_COORD, intensity_barnumber);
   frequency_text ft(CLK_VGA, VGA_HORZ_COORD, VGA_VERT_COORD, freq_text);
   menu_text_gen mt(CLK_VGA, SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW15, VGA_HORZ_COORD, VGA_VERT_COORD, menu_text);
   
   Generate_Color gc (btn_clk, unlock_statusSW6, btnL_press, btnR_press, unlock_statusSW5, freqcount, intensitycount, color, color_selector,intensity_color);
   
   wire [5:0] intensity_bar;
   volume_bar(VGA_HORZ_COORD,VGA_VERT_COORD,intensitycount,intensity_bar);
   
   create_ring_object cro(unlock_statusSW6,CLK, btnC, !SW0, freqcount, intensitycount, VGA_HORZ_COORD,VGA_VERT_COORD, ring);
   wire sphere; 
   create_sphere csph(unlock_statusSW62,CLK, btnC, !SW0, freqcount, intensitycount, VGA_HORZ_COORD,VGA_VERT_COORD, sphere); 
       
   Draw_Waveform draw_waveform(clk1, SW0, SW1, SW4, SW5, SW6, color, ring, sphere, unlock_statusSW62, wave_sample, VGA_HORZ_COORD, VGA_VERT_COORD, maxsignal[11:2], grid_shift,
   freq_text[freqcount-1], VGA_Red_waveform, VGA_Green_waveform, VGA_Blue_waveform);   
    
    wire [8:0] omenutext;
    change_switches cs(SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW15, menu_text, omenutext);
    
// Please instantiate the background drawing module below   

    Draw_Background draw_background(SW2, SW3, VGA_HORZ_COORD, VGA_VERT_COORD, color_selector, grid_shift, unlock_statusSW5, red_lock_object, green_unlock_object, 
    omenutext, intensity_barnumber[intensitycount], VGA_Red_grid, VGA_Green_grid, VGA_Blue_grid);
// Please instantiate the VGA display module below     
    
    VGA_DISPLAY vga_display(CLK, VGA_Red_waveform, VGA_Green_waveform, VGA_Blue_waveform, VGA_Red_grid, 
    VGA_Green_grid, VGA_Blue_grid, intensity_color, intensity_bar, VGA_HORZ_COORD, VGA_VERT_COORD, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_VS, VGA_HS, CLK_VGA);
     
     
     
     
                    
endmodule