`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2022 16:28:29
// Design Name: 
// Module Name: TransitionGenerate
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


module TransitionGenerate(
    input logic clk,
    input logic reset,
    input logic ButtonHold , 
    output logic T1,
    output logic T2,
    output logic T3,
    output logic [27:0]countHold
    );

    
    always_ff @(posedge clk) begin 
        if(reset) begin 
            countHold <= 'd0 ; 
            T1 <= 'b0 ;
            T2 <= 'b0 ;
            T3 <= 'b0 ;
        end  else begin 
            if(ButtonHold) begin 
                countHold <= countHold + 'd1 ;
                if (countHold >= 'd99999999) begin 
                    T1 <= 'b0 ; 
                    T2 <= 'b1 ;
                    T3 <= 'b0 ;
                    if(countHold >= 'd149999999)begin 
                        countHold <= 'd99999999 ; 
                    end
                end 
            
            end else  begin 
                if (countHold < 'd99999999 && countHold > 'd0) begin 
                    T1 <= 'b1 ;
                    T2 <= 'b0 ;
                    T3 <= 'b0 ; 
                end else begin
                    T1 <= 'b0 ;
                    T2 <= 'b0 ;
                    T3 <= 'b1 ; 
                end
                countHold <='d0 ;
            end
        end
    end
endmodule
