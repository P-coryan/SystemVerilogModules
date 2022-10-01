`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2022 12:27:15
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
    input logic CLK100MHZ,
    input logic BTNC ,
    input logic BTNU,
    // input logic BTNL,
    // input logic BTNR, 
    // output logic stableSignal,
    //  output logic [1:0]stateOut
    output logic [27:0] countOut
    );

    logic T1 ;
    logic T2 ;
    logic T3 ;
    logic [27:0]countHold ; 
    // logic clk100hz ; 

    // Debouncer DBCR(
    //     .clk(CLK100MHZ) , 
    //     .buttonDebouncer(BTNC),
    //     .reset(BTNU),
    //     .stableSignal(stableSignal)
    // );

    //  clock_divider #(100) clkdiv(
    //     .clk_in(CLK100MHZ),
    //     .clk_out(clk100hz)
    // ); 



    TransitionGenerate TransState(
        .clk(CLK100MHZ),
        .reset(BTNU),
        .ButtonHold(BTNC),
        .T1(T1),
        .T2(T2),
        .T3(T3),
        .countHold(countHold)
    ) ;

        CounterFSM counter(
        .clk(CLK100MHZ),
        .reset(BTNU),
        .countHold(countHold),
        .T1(T1),
        .T2(T2),
        .T3(T3),
        .countOut(countOut)
    );



endmodule
