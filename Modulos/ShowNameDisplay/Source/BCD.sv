`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 16:44:59
// Design Name: 
// Module Name: BCD
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


module BCD(
    input logic sw,
    input logic [2:0] CountAN,
    output logic [6:0]Segment 
    );

    always_comb begin 
        if(sw==0) begin
            case(CountAN)
                3'd7:
                    Segment <= ~7'b1110011;  // P ~7'b1100111;
                3'd6:
                    Segment <= ~7'b1110111;  // A
                3'd5:
                    Segment <= ~7'b1111000; // t
                3'd4:
                    Segment <= ~7'b1010000 ;  //r
                3'd3:
                    Segment <= ~7'b0000110  ;//i
                3'd2:
                    Segment <= ~7'b1011000 ; // C
                3'd1:
                    Segment <= ~7'b0000110  ; //i
                3'd0:
                    Segment <= ~7'b1011100 ; // o
            endcase
        
        end 
        else begin 
              case(CountAN)
                3'd7:
                    Segment <= ~7'b1011000 ;  // C
                3'd6:
                    Segment <= ~7'b1110111;  // A
                3'd5:
                    Segment <= ~7'b1010000; // r
                3'd4:
                    Segment <= ~7'b1010000 ; //r
                3'd3:
                    Segment <= ~7'b1110111; //A
                3'd2:
                    Segment <= ~7'b1101101 ; // s
                3'd1:
                    Segment <= ~7'b1011000 ; //c
                3'd0:
                    Segment <= ~7'b1011100 ; // o
            endcase

        end

    end
endmodule
