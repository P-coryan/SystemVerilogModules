`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 18:57:08
// Design Name: 
// Module Name: AnodeController
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


module AnodeController(
    input logic [2:0] CountAN,
    output logic [7:0] Anodo
    );

    always_comb begin 
        case(CountAN)
                3'd7:
                    Anodo <= ~8'b10000000;
                3'd6:
                    Anodo <= ~8'b01000000 ;
                3'd5:
                    Anodo <= ~8'b00100000;
                3'd4:
                    Anodo <= ~8'b00010000;
                3'd3:
                    Anodo <= ~8'b00001000 ;
                3'd2:
                    Anodo <= ~8'b00000100;
                3'd1:
                    Anodo <= ~8'b00000010;
                3'd0:
                    Anodo <= ~8'b00000001;
        endcase

    end

endmodule
