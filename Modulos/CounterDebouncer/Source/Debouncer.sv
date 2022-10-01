`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2022 12:37:54
// Design Name: 
// Module Name: Debouncer
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


module Debouncer(
    input logic clk,
    input logic buttonDebouncer,
    input logic reset,
    output logic stableSignal
    );
    logic [9:0]counter ;

    always_ff @(posedge clk) begin 
        if(reset) begin 
            counter <= 'd0 ;
            stableSignal <= 'b0 ; 
        end else begin 
             if (buttonDebouncer) 
                counter <= counter + 1 ;   
             else begin
                counter <= 'd0 ; 
                stableSignal <= 'b0 ; 
             end
            if ( counter == 'd1023) 
                stableSignal <= 'b1 ; 
        end
       
       
    end
endmodule
