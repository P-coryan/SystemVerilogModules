`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 16:43:42
// Design Name: 
// Module Name: Main
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


module Main(
    input logic CLK100MHZ, BTNC,
    input logic SW,
    output logic [6:0]SEG,
    output logic [7:0]AN
    );
    logic clkDiv60 ;
    logic [2:0] contador; 

    clock_divider #(640) clkdiv(
        .clk_in(CLK100MHZ),
        .clk_out(clkDiv60)
    ); 

    counter #(3) ContadorAN(
        .clk(clkDiv60),
        .reset(BTNC),
        .count(contador)
    );

    AnodeController controller(
        .CountAN(contador),
        .Anodo(AN)
    );

    BCD display(
        .sw(SW),
        .CountAN(contador),
        .Segment(SEG)
    );


endmodule
