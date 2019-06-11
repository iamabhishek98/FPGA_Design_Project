`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2019 19:02:42
// Design Name: 
// Module Name: displayfrequency
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


module displayfrequency(
input [3:0] freqcount,
input unlockstatus,
input SW5,
input CLK,
input slow_CLK,
output reg [7:0] SEVEN_SEG,
output reg [3:0] DISPLAY
    );
    wire rr_clk;
    clk_10 rr(CLK,rr_clk);
    
    reg [1:0] disp_count = 2'b0; 
    
    always @ (posedge slow_CLK) begin
       
       if (SW5 && unlockstatus) begin
       
       disp_count <= disp_count + 1;

if (freqcount == 1) begin //---- lower than 300
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b0111; end //-
2'b01: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1011; end//-    
2'b10: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1101; end//-
2'b11: begin SEVEN_SEG = 8'b10111111; DISPLAY = 4'b1110; end//-
endcase
end

else if (freqcount == 2) begin //0300
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10110000; DISPLAY = 4'b1011; end//3   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 3) begin //0400
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10011001; DISPLAY = 4'b1011; end//4   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 4) begin //0500
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10010010; DISPLAY = 4'b1011; end//5   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 5) begin //0600
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10010000; DISPLAY = 4'b1011; end//6   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 6) begin //0700
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b11111000; DISPLAY = 4'b1011; end//7   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 7) begin //0800
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10000000; DISPLAY = 4'b1011; end//8   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 8) begin //0900
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b0111; end //0
2'b01: begin SEVEN_SEG = 8'b10010000; DISPLAY = 4'b1011; end//9   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

else if (freqcount == 9) begin //1000 and above
case (fdisp_count) 
2'b00: begin SEVEN_SEG = 8'b11111001; DISPLAY = 4'b0111; end //1
2'b01: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1011; end//0   
2'b10: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1101; end//0
2'b11: begin SEVEN_SEG = 8'b11000000; DISPLAY = 4'b1110; end//0
endcase
end

    end

    end

endmodule
