`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2023 14:20:21
// Design Name: 
// Module Name: elevDeneme_sim
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


module simuTerm();
    reg clk_50hz,
    rst,
 floor_0_p,floor_1_p,floor_2_p,floor_3_p,floor_4_p
   , direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
 floor_4_d;
 
wire
    
led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

a,b,c,d,e,f,g,p;

elevator UUT
(
    .clk_50hz(clk_50hz),
    .rst(rst),
    .floor_0_p(floor_0_p),
    .floor_1_p(floor_1_p),
    .floor_2_p(floor_2_p),
    .floor_3_p(floor_3_p),
    .floor_4_p(floor_4_p),
    
    .floor_0_d(floor_0_d),
    .floor_1_d(floor_1_d),
    .floor_2_d(floor_2_d),
    .floor_3_d(floor_3_d),
    .floor_4_d(floor_4_d),
    .led_outside_0(led_outside_0),
    .led_outside_1(led_outside_1),
    .led_outside_2(led_outside_2),
    .led_outside_3(led_outside_3),
    .led_outside_4(led_outside_4),
    .led_inside_0(led_inside_0),
    .led_inside_1(led_inside_1),
    .led_inside_2(led_inside_2),
    .led_inside_3(led_inside_3),
    .led_inside_4(led_inside_4),
    .led_busy(led_busy),
    .direction_1(direction_1),
    .direction_2(direction_2),
    .direction_3(direction_3),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .p(p)
);

always #50 clk_50hz = ~clk_50hz; 
initial begin
rst = 1;
floor_0_p = 0;floor_1_p = 0;floor_2_p = 0;floor_3_p = 0;floor_4_p = 0;
clk_50hz = 0;

#25 floor_4_p = 1;
#50
floor_4_p = 0;
floor_2_p = 1; direction_2 = 1;
#100
floor_2_p = 0; direction_2 = 0;
floor_1_p = 1; direction_1 = 1;
#110 floor_1_p = 0; direction_1 = 0;
#500000 floor_3_d = 1; 
#220 floor_3_d = 0; 
end

    
endmodule
