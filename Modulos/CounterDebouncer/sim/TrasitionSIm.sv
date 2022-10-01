`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2022 17:19:42
// Design Name: 
// Module Name: TrasitionSIm
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


module TrasitionSIm();
     logic clk ;
     logic ButtonHold ;
     logic reset ;
     logic [27:0] countOut ;

    Main TransSim(
        .CLK100MHZ(clk),
        .BTNC(ButtonHold),
        .BTNU(reset),
        .countOut(countOut)
    ) ; 

    always #5 clk = ~clk ; 

    initial begin 
        clk= 0 ; 
        reset =1 ; 
        ButtonHold = 0 ; 
        #10
        reset =0 ;
        #10
         ButtonHold = 1 ; 
        #1500000020
        ButtonHold = 0 ;
        #100
        ButtonHold = 1 ; 
        #100
        ButtonHold = 0 ;

        
    end
endmodule
