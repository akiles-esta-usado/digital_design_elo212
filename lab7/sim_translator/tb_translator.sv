///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in, out)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////
localparam period         = 10;           // duración de un periodo
localparam test_duration  = 10000; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_translator();
    timeunit      1ns;
    timeprecision 10ps;

    logic   clk, reset;
    integer counter;

    //////////////////////////////////////////////////////////
    // Agrega las entradas y salidas a las estructuras.
    // Es para agruparlas, pero perfectamente se pueden borrar
    //////////////////////////////////////////////////////////

    logic [7:0]  in_currentState;
    logic [15:0] in_toDisplay;
    logic        in_displayFormat;

    logic [6:0] out_segments;
    logic [4:0] out_anodes;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    translator dut(
        .i_clk           (clk),
        .i_reset         (reset),
        .i_currentState  (in_currentState),
        .i_displayFormat (in_displayFormat),
        .i_toDisplay_bin (in_toDisplay),
        .o_segments      (out_segments),
        .o_anodes        (out_anodes)
    );

    task automatic loadTranslator(ref logic [15:0] toDisplay,
                                  ref logic [7:0]  currentState,
                                  ref logic        Format,
                                  input logic [15:0] newDisplay,
                                  input logic [7:0]  newState,
                                  input logic        newFormat
                                  );
        toDisplay    = newDisplay;
        currentState = newState;
        Format       = newFormat;
        #(140*period);
    endtask;

    task automatic change_constantly(ref logic Format);
        repeat (10) begin
            Format = ~Format;
            #(8*period);
        end
    endtask;

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina
        in_toDisplay = 'd10;
        in_currentState = 'b0001;
        in_displayFormat = 'd1;

        #(3*period);

        // toDisplay = 10 (0a), currentState = 2, displayFormat = 1
        loadTranslator(in_toDisplay, in_currentState, in_displayFormat, 'd10, 'b10, 'd1);
        change_constantly(in_displayFormat);

        // toDisplay = 11 (0b), currentState = 3, displayFormat = 0
        loadTranslator(in_toDisplay, in_currentState, in_displayFormat, 'd11, 'b11, 'd0);
        change_constantly(in_displayFormat);


        // toDisplay = 255 (FF), currentState = 0, displayFormat = 1
        loadTranslator(in_toDisplay, in_currentState, in_displayFormat, 'd255, 'b0, 'd1);
        change_constantly(in_displayFormat);

        #(10 * period);
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
        counter = 'd0;

        #(reset_duration);
        reset = 0;

        #(test_duration);
        $finish;
    end

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule