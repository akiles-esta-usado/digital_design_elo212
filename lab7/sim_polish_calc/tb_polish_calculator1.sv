///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in, out)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////
localparam period         = 10;           // duración de un periodo
localparam test_duration  = 4000* period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_polish_calc1();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    //////////////////////////////////////////////////////////
    // Agrega las entradas y salidas a las estructuras.
    // Es para agruparlas, pero perfectamente se pueden borrar
    //////////////////////////////////////////////////////////

    logic        in_Enter;
    logic [15:0] in_DataIn;

    logic [15:0] out_DataOut;
    logic [3:0]  out_CurrentState;
    logic [3:0]  out_Flags;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    polish_calculator #(.WIDTH(16)) dut(
        .clk          (clk),
        .reset        (reset),
        .Enter        (in_Enter),
        .DataIn       (in_DataIn),
        .DataOut      (out_DataOut),
        .CurrentState (out_CurrentState),
        .Flags        (out_Flags)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        // Ajustar un valor, 10
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd10;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, 5
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd5;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, +
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd0; // 00
        #(period);
        in_Enter = 'd0;


        // Testeando Reset
        #(10 * period);
        reset = 1;
        #period;
        reset = 0;
        #(10 * period);


        // Test de Negativo
        // Ajustar un valor, 50
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd50;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, 60
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd60;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, -
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd1; // resta
        #(period);
        in_Enter = 'd0;

        #(10 * period);
        in_Enter = 1;
        #(period);
        in_Enter = 0;
        #(10 * period);



        // Test de Carry
        // Ajustar un valor, -10
        #(period);
        in_Enter = 'd1;
        in_DataIn = -'d10;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, -5
        #(period);
        in_Enter = 'd1;
        in_DataIn = -'d5;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, +
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd0; // suma
        #(period);
        in_Enter = 'd0;
        

        #(10 * period);
        in_Enter = 1;
        #(period);
        in_Enter = 0;
        #(10 * period);



        // Test de Overflow
        // Ajustar un valor, 2^(16-1)
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd32_767;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, 1
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd1;
        #(period);
        in_Enter = 'd0;

        // Ajustar un valor, suma
        #(period);
        in_Enter = 'd1;
        in_DataIn = 'd0;
        #(period);
        in_Enter = 'd0;


        #(10 * period);


        $finish;
    end


    ////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ////////////////////////////////////////////////////
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