`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 07:40:39
// Design Name: 
// Module Name: counter
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


module counter #(parameter N=3)(
    input logic clk, reset,
    output logic [N-1:0] count
    );
    
    always_ff @(posedge clk) begin
        if(reset)
            count <= 'b0;
        else
            count <= count + 1;
    end
    
    
endmodule
