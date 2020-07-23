///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in_s, out_s)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////
typedef struct packed {
    logic [1:0] color;
} in_s;

typedef struct packed{
    logic       led_r, led_g, led_b;
} out_s;

localparam period         = 10;           // duración de un periodo
localparam test_duration  = 40  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_to_tricolor();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;
    in_s  in;
    out_s out;

    localparam GREEN    = 2'b00;
    localparam YELLOW   = 2'b01;
    localparam RED      = 2'b10;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    to_tricolor dut(
        .i_color(in.color),
        .o_led_r(out.led_r), 
        .o_led_g(out.led_g), 
        .o_led_b(out.led_b)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        in.color = GREEN;

        #(period);
        in.color = YELLOW;

        #(period);
        in.color = RED;

        #(period);
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