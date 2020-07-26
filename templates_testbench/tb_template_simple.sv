///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in, out)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////
localparam period         = 10;           // duración de un periodo
localparam test_duration  = 40  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb-testbench-name();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    //////////////////////////////////////////////////////////
    // Agrega las entradas y salidas a las estructuras.
    // Es para agruparlas, pero perfectamente se pueden borrar
    //////////////////////////////////////////////////////////

    struct packed {
        logic       none;
    } in;

    struct packed{
        logic       none;
    } out;


    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    design-under-test dut(
        .i_clk    (clk),
        .i_reset  (reset),
        ...
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

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