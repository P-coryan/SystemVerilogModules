`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2022 10:00:13
// Design Name: 
// Module Name: CounterFSM
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


module CounterFSM(
    input logic clk,
    input logic reset,
    input logic [27:0]countHold,
    input logic T1,
    input logic T2,
    input logic T3,
    output logic [27:0] countOut
    );

    enum logic [1:0] { S0= 0 , S1 , S2 , S3} State , NextState ; 
  
    logic [27:0]countNext ;
    //Sequecial always blocks :
    always_ff @(posedge clk) begin 
        if(reset) begin
             countOut <= 'd0 ;
             State <= S0; 

        end  else  
            State <= NextState ;
            countOut <= countNext ; 
           
    end

  
    //logica combinacional para cambio de estado.
    always_comb begin 
        case(State)
            S0: 
                begin 
                    if(T1)
                        NextState <= S1 ;
                    else if(T2)
                        NextState <= S3 ;
                    else 
                        NextState <= S0 ;  // mantenerse en el estado actual 
                end 
            S1:
                begin
                    if(T3)
                        NextState <= S2 ;
                    else
                        NextState <= S1 ; 
                    end
            S3: begin 
                    if(T3)
                        NextState <=S2 ;
                    else
                        NextState <=S3 ;
                end
            S2:
                begin
                    if(T1)
                        NextState <= S1 ;
                    else if(T2)
                        NextState <=S3 ;
                    else 
                        NextState <=S2 ;
                end 
        endcase 
    end

    always_comb begin 
        countNext = 'd0 ;  
         case(State)
            S1:
                begin
                        countNext <= countOut +'d1 ; 
                    end
            S3: begin 
                    if(countHold >= 'd149999999) begin 
                        countNext <= countOut +'d1 ; 
                    end
                end
        endcase 

    end
endmodule
