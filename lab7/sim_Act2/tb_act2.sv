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
module tb_act2();
    timeunit      1ns;
    timeprecision 100ps;

    logic   clk, resetN;

    //////////////////////////////////////////////////////////
    // Agrega las entradas y salidas a las estructuras.
    // Es para agruparlas, pero perfectamente se pueden borrar
    //////////////////////////////////////////////////////////

    logic        in_Enter, in_Undo;
    logic [15:0] in_DataIn;
    logic [3:0]  out_Flags;
    logic [6:0]  out_CurrentState;
    logic [15:0] out_ToDisplay;
    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    
    
    Act2_RPCalculator dut(
        .clk               (clk),
        .resetN            (resetN),
        .Enter             (in_Enter),
        .Undo              (in_Undo),
        .DataIn            (in_DataIn),
        .Flags             (out_Flags),
        .ToDisplay         (out_ToDisplay),
        .CurrentState      (out_CurrentState)
    );

    localparam SUMA  = 'd0;
    localparam RESTA = 'd1;
    localparam OR    = 'd2;
    localparam AND   = 'd3;

    task automatic flip_button( 
            ref logic button, 
            input int interval = 'd20
        );
        button = ~button;
        #(interval*period);
        button = ~button;
        #(period);
    endtask;

    task automatic put_data(
            ref logic [15:0] dataIn,
            input int        value,
            input int        interval = 20
        );
        dataIn = value;
        flip_button(in_Enter);
        #(period * interval);
    endtask;

    initial begin
        in_Undo          = 'd0;
        in_DataIn        = 'd0;
        in_Enter         = 'd0;
        #(reset_duration);

        // Realizamos la operación 10 + 5
        put_data(in_DataIn, 'd10);  // -> Wait_B
        put_data(in_DataIn, 'd5);   // -> Wait_OpCode
        put_data(in_DataIn, SUMA);  // -> Show_Result

        // Borramos la operación
        flip_button(in_Undo);       // -> Wait_OpCode
        flip_button(in_Undo);       // -> Wait_B
        flip_button(in_Undo);       // -> Wait_A
        flip_button(in_Undo);       // -> Wait_A
        flip_button(in_Undo);       // -> Wait_A

        // Realizamos la operación 10 - (-5)
        put_data(in_DataIn, 'd20);  // -> Wait_B
        put_data(in_DataIn, -'d5);  // -> Wait_OpCode
        put_data(in_DataIn, RESTA); // -> Show_Result

        flip_button(in_Enter);      // -> Wait_A

        #(16 * period);

        $finish;
    end


    ////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ////////////////////////////////////////////////////
    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 1;
        resetN = 0;

        #(reset_duration);
        resetN = 1;
    end

    initial begin
        #(test_duration);
        $finish;
    end
    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
