`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2022 13:22:04
// Design Name: 
// Module Name: SimDebouncer
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


module SimDebouncer();
    logic clk ;
    logic boton ;
    logic reset ;
    logic stableSignal ; 

    //Simular en 12 us par que se vean ajustadas las senales 

    Main SimDBNC(
        .CLK100MHZ(clk),
        .BTNC(boton),
        .BTNU(reset),
        .stableSignal(stableSignal)
    );
    always #5 clk = ~clk ;

    initial begin
        
        clk = 0;                                
        reset = 1;
        #10
        reset = 0;
        boton = 0;
        #15
        boton = 1;
        #1
        boton = 0;
        #1
        boton = 1;
        #1
        boton = 0;
        #1
        boton = 1;
        #1
        boton = 0;
        #1
        boton = 1;
        #1
        boton = 0;
        #1
        boton = 1;
        #10500
        boton = 0;
    end

endmodule
