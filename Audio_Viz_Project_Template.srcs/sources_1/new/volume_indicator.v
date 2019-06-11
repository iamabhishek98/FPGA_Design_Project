`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 01:18:36
// Design Name: 
// Module Name: volume_indicator
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


module volume_indicator(
input [3:0] freqcount,
input CLK,
input slow_clk,
input [11:0] intensity,
input SW0,
input SW5,
input SW6,
input SW15,
output reg [12:0] LED,
output reg [7:0] SEVEN_SEG,
output reg [3:0] DISPLAY,
output reg [11:0] output_maxsignal,
output reg [3:0] icount
    );
   wire rr_clk;
   clk_10 rr(CLK,rr_clk);
   reg [11:0] signal = 12'b0;
//   reg [5:0] max_peaks_count = 6'b0; 
   //reg [11:0] max_peaks_value = 12'b0;
   
   
   reg [1:0] disp_count = 2'b0; 
   reg [11:0] count_intense = 12'b0;
   wire [3:0] count;
   
   volume_indicator_count vic(rr_clk,SW0,signal,count);
       
   //switching on the sevenseg display   
   always @ (posedge slow_clk) begin
   icount <= count;
      if (count_intense == 2000) begin 
          signal <= 0;
          count_intense <= 0;
      end
      else begin
          count_intense <= count_intense + 1;
      end
                  
      if (intensity>=signal) begin 
      signal <= intensity; 
      end        
      if (!SW0) begin output_maxsignal = signal; end
      if (SW15) begin output_maxsignal = 0; signal <= 0; end
      disp_count<=disp_count+1;  
  
   
   if (SW5 || SW6) begin
   //LED = 13'b0000000000000;
   if (freqcount == 1) begin //---- lower than 300
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b0111; end //-
   2'b01: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1011; end//-    
   2'b10: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1101; end//-
   2'b11: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1110; end//-
   endcase
   end
   
   else if (freqcount == 2) begin //0300
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10110000; DISPLAY = 4'b1011; end//3   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 3) begin //0400
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10011001; DISPLAY = 4'b1011; end//4   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 4) begin //0500
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10010010; DISPLAY = 4'b1011; end//5   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 5) begin //0600
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10000010; DISPLAY = 4'b1011; end//6   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 6) begin //0700
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b11111000; DISPLAY = 4'b1011; end//7   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 7) begin //0800
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10000000; DISPLAY = 4'b1011; end//8   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 8) begin //0900
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b10010000; DISPLAY = 4'b1011; end//9   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 9) begin //1000 and above
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b0111; end //1
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end//0   
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   
   else if (freqcount == 10) begin //1000 and above
   case (disp_count) 
   2'b00: begin SEVEN_SEG = 8'b10001110; DISPLAY = 4'b0111; end//F
   2'b01: begin SEVEN_SEG = 8'b10001110; DISPLAY = 4'b1011; end//F   
   2'b10: begin SEVEN_SEG = 8'b10001110; DISPLAY = 4'b1101; end//F
   2'b11: begin SEVEN_SEG = 8'b10001110; DISPLAY = 4'b1110; end//F
   endcase
   end
  
   end
   
   
   //else if (!SW5) begin   
   if (count == 12) begin //12
    LED = 13'b1111111111111;
    if (!SW5 && !SW6) begin
    case (disp_count) 
    2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
    2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end//0    
    2'b10: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b1101; end//1
    2'b11: begin SEVEN_SEG = 8'b10100100; DISPLAY = 4'b1110; end//2
    endcase
   end
   end
   
   else if (count == 11) begin //11
    LED = 13'b0111111111111;
    if (!SW5 && !SW6) begin
    case (disp_count)
    2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end//0
    2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end//0   
    2'b10: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b1101; end  //1
    2'b11: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b1110; end  //1
    endcase
    end  
    end
   
   else if (count == 10) begin //10
    LED = 13'b0011111111111;
    if (!SW5 && !SW6) begin
    case (disp_count)
    2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
    2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
    2'b10: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b1101; end  //1
    2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end  //0
    endcase
    end
    end
   
   else if (count == 9) begin //9
   LED = 13'b0001111111111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0
   2'b11: begin SEVEN_SEG = 8'b10010000; DISPLAY = 4'b1110; end //9  
   endcase
   end
   end
   
   else if (count == 9) begin //8
   LED = 13'b0000111111111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0
   2'b11: begin SEVEN_SEG = 8'b10000000; DISPLAY = 4'b1110; end  //8
   endcase
   end
   end
   
   else if (count == 8) begin //7
   LED = 13'b0000011111111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0
   2'b11: begin SEVEN_SEG = 8'b11111000; DISPLAY = 4'b1110; end  //7
   endcase
   end
   end
   
   else if (count == 7) begin //6
   LED = 13'b0000001111111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0   
   2'b11: begin SEVEN_SEG = 8'b10000010; DISPLAY = 4'b1110; end  //6
   endcase 
   end
   end
   
   else if (count == 5) begin //5
   LED = 13'b0000000111111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0   
   2'b11: begin SEVEN_SEG = 8'b10010010; DISPLAY = 4'b1110; end  //5
   endcase
   end
   end
   
   else if (count == 4) begin //4
   LED = 13'b0000000011111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0   
   2'b11: begin SEVEN_SEG = 8'b10011001; DISPLAY = 4'b1110; end  //4
   endcase
   end
   end
   
   else if (count == 3) begin //3
   LED = 13'b0000000001111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end //0  
   2'b11: begin SEVEN_SEG = 8'b10110000; DISPLAY = 4'b1110; end  //3
   endcase
   end
   end
   
   else if (count == 2) begin //2
   LED = 13'b0000000000111;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end  //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end  //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end  //0   
   2'b11: begin SEVEN_SEG = 8'b10100100; DISPLAY = 4'b1110; end //2
   endcase
   end
   end
   
   else if (count == 1) begin //1
   LED = 13'b0000000000011;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end //0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end //0   
   2'b11: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b1110; end //1 
   endcase
   end
   end
   
   else begin //0
   LED = 13'b0000000000001;
   if (!SW5 && !SW6) begin
   case (disp_count)
   2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end//0
   2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end//0    
   2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0   
   2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
   endcase
   end
   end
   
   //end
  
  
  
   end
 
endmodule
