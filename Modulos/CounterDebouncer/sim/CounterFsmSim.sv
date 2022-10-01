`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2022 15:21:04
// Design Name: 
// Module Name: CounterFsmSim
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


module CounterFsmSim();
    logic clk ;
    logic T1 ;
    logic T2 ;
    logic T3 ;
    logic reset ;
    logic [1:0] stateOut ; 
 // correr en 200ns para que se vea bien 
   Main counterFsmSim(
        .CLK100MHZ(clk),
        .BTNC(T1),
        .BTNU(reset),
        .BTNL(T2),
        .BTNR(T3),
        .stateOut(stateOut)
    );

    always #5 clk = ~clk ;

    initial begin 
        clk = 0;                                
        reset = 1;
        T1 = 0 ; 
        T2 = 0 ;
        T3 = 0 ; 
        #10
        reset = 0;
        #10
        T1 = 1 ;
        #10
        T1 = 0 ;
        T3 = 1 ;
        #10
        T3 = 0 ; 
        T2 = 1 ; 
        #100
        reset=1 ;
        #10
        reset=0 ; 


    end

endmodule
