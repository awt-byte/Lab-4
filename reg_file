`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 03:52:15 PM
// Design Name: 
// Module Name: reg_file
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



module reg_file
    #(parameter n = 4, 
      parameter bits = 8)
    (
        input WE, clk, 
        input [n - 1: 0] address_w, address_r, 
        input [bits - 1:0] data_w, 
        output [bits - 1:0] data_r 
    );

    wire [2  n - 1:0] w_decoder, r_decoder;
    wire [bits - 1:0] register_outputs[2  n - 1:0];

    decoder_generic #(.N(n)) write_decoder (
        .w(address_w), 
        .en(WE), 
        .y(w_decoder)
    );
    decoder_generic #(.N(n)) read_decoder (
        .w(address_r), 
        .en(1), 
        .y(r_decoder)
        );

    genvar i;
    generate
        for (i = 0; i < 2 ** n; i = i + 1) 
        begin: registers
            simple_register_load #(.N(bits)) register (
                .clk(clk),
                .load(w_decoder[i]),
                .I(data_w),
                .Q(register_outputs[i])
            );

            assign data_r = r_decoder[i] ? register_outputs[i] : {bits{1'bz}};
        end
    endgenerate

endmodule
