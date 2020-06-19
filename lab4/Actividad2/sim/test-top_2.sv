////////////////////////////////////////////////////////////////////////
// V0.1
// Este módulo debería simplificar el trabajo asociado a la verificación 
// exhaustiva de diseños HDL simples.
////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in_s, out_s)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////

localparam period            = 10;     // duración de un periodo
localparam n_periods         = 100000;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // Razón respecto al periodo


///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_top_2();
    timeunit 1ns;
    timeprecision 1ps;

    logic   clk, reset;
    logic clock_out_50M;
    logic clock_out_30M;
    logic clock_out_10M;
    logic clock_out_1M;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    S4_Actividad2 dut (
            .clock_100M     (clk),
            .reset          (reset),
            .clock_out_50M  (clock_out_50M),
            .clock_out_30M  (clock_out_30M),
            .clock_out_10M  (clock_out_10M),
            .clock_out_1M   (clock_out_1M)
        );

    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

        #(period*n_periods);
        $finish;

    end
    
    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
