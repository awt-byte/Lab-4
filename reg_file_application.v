`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 02:25:15 PM
// Design Name: 
// Module Name: reg_file_application
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


module reg_file_application(
    input [3:0] data_w,
    input [6:0] address_w,
    input WE, switch, clk,
    output [6:0] sseg,
    output [7:0] AN,
    output DP
    );

    assign DP = 1;

    assign AN[0] = 0;
    assign AN[1] = 1;
    assign AN[2] = 1;
    assign AN[3] = 1;
    assign AN[4] = 1;
    assign AN[5] = 1;
    assign AN[6] = 1;
    assign AN[7] = 1;

    wire [3:0] data_r;
    wire [6:0] address_r;

    assign address_r = switch ? 7'b0 : address_w;

    reg_file #(.n(7), .bits(4)) reg_file_test (
        .WE(WE),
        .clk(clk),
        .address_w(address_w),
        .address_r(address_r),
        .data_w(data_w),
        .data_r(data_r)
    );

    hex2sseg display_sseg(
        .hex(data_r),
        .sseg(sseg)
    );


endmodule
