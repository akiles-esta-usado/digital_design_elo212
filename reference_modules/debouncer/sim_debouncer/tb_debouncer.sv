///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in, out)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////
localparam period         = 10;           // duración de un periodo
localparam test_duration  = 400  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_debouncer();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    //////////////////////////////////////////////////////////
    // Agrega las entradas y salidas a las estructuras.
    // Es para agruparlas, pero perfectamente se pueden borrar
    //////////////////////////////////////////////////////////

    struct {
        logic PB;
    } in;

    struct {
        logic PB_pressed_status;
        logic PB_pressed_pulse;
        logic PB_released_pulse;
    } out_fsm, out_counter;


    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    PB_Debouncer_FSM dut_fsm(
        .clk                (clk),
        .rst                (reset),
        .PB                 (in.PB),
        .PB_pressed_status  (out_fsm.PB_pressed_status),
        .PB_pressed_pulse   (out_fsm.PB_pressed_pulse),
        .PB_released_pulse  (out_fsm.PB_released_pulse)
    );

    PB_Debouncer_counter dut_counter(
        .clk                (clk),
        .rst                (reset),
        .PB                 (in.PB),
        .PB_pressed_status  (out_counter.PB_pressed_status),
        .PB_pressed_pulse   (out_counter.PB_pressed_pulse),
        .PB_released_pulse  (out_counter.PB_released_pulse)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        #period;
        in.PB = 'd1;
        #period;
        in.PB = 'd0;

        #(5*period);
        in.PB = 'd1;
        # (5 * period);
        in.PB = 'd0;

        #(5*period);
        in.PB = 'd1;
        # (20 * period);
        in.PB = 'd0;

        #(30 * period);

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