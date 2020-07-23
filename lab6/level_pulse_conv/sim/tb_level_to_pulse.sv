///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in_s, out_s)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////

localparam period         = 10;           // duración de un periodo
localparam test_duration  = 40  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset


///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_level_to_pulse();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;
    logic   in, out_fall, out_rise;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    level_to_pulse dut(
        .i_clk    (clk),
        .i_reset  (reset),
        .i_in     (in),
        .o_rise_out    (out_rise),
        .o_fall_out    (out_fall)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina
        
        #(period);
        in = 1'b1;
        #(period);
        in = 1'b0;

        #(period);
        in = 1'b1;
        #(5*period);
        in = 1'b0;

        // Finalizando
        #(5*period);
        $finish;

    end


    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 1;
        reset = 1;

        #(reset_duration);
        reset = 0;
    end

    initial begin
        #(test_duration);
        $finish;
    end
    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
