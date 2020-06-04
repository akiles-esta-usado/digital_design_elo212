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
localparam n_periods         = 10000000;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // Razón respecto al periodo

localparam cuenta = 5;

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_clock_divider_simple();
    timeunit 1ns;
    timeprecision 1ps;

    logic   clk, reset;

    logic clk_out;
    logic [$clog2(cuenta)-1:0] counter;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    clock_divider_simple #(
        .COUNTER_MAX(cuenta)) 
        dut1(
        .i_clk        (clk),
        .i_reset      (reset),
        .o_clk        (clk_out),
        .o_counter    (counter)
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
