///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in_s, out_s)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////

localparam period         = 10;           // duración de un periodo
localparam test_duration  = 400 * period; // duración máxima del test
localparam reset_duration = 0.2 * period; // duración del reset

///////////////////////////////////o
// Modifica el nombre del testbench
///////////////////////////////////
module tb_unsigned_to_bcd();
    timeunit      1ns;
    timeprecision 100ps;

    logic        clk, reset;
    integer counter;

    logic        trigger;
    logic        idle;

    logic [31:0] in, bcd;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    unsigned_to_bcd my_dut(
        .clk     (clk),
        .trigger (trigger),
        .in      (in),
        .idle    (idle),
        .bcd     (bcd)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        in = 'd10; // 0x1010

        #period;

        trigger = 1;
        #period;
        trigger = 0;

    end

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        #(70 * period);

        in = 'd255255; // 0x1010

        #period;

        trigger = 1;
        #period;
        trigger = 0;

        #(70 * period);
        $finish;

    end


    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    always #(period*0.5) clk = ~clk;
    always #(period)     counter++;

    initial begin
        clk     = 1;
        reset   = 1;
        counter = 0;

        #(reset_duration);
        reset = 0;
    end

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule