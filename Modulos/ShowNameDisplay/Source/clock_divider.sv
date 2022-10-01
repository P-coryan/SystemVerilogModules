`timescale 1ns / 1ps

module clock_divider #( parameter FREC=3)
 (input logic clk_in ,
  output logic clk_out = 0); 
    
    localparam COUNTER_MAX=(100_000_000/(2*FREC));
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;
    //Resetea el contador e invierte el valor del reloj de salida
    // cada vez que el contador llega a su valor maximo
    
  always_ff @(posedge clk_in) begin
    if (counter == COUNTER_MAX-1) begin
        // Se resetea el contador y se invierte la salida
        counter = 'd0;
        clk_out = ~clk_out;
    end else begin
        // Se incremente el contador y se mantiene la salida con
        // su valor anterior
        counter = counter + 'd1;
        clk_out = clk_out;
    end
    end
endmodule