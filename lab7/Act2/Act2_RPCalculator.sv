module Act2_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, // La N viene de NEGADO
        input  logic        Enter, Undo, //PB
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags, // [3:0] = {N, Z, C, V}
        output logic [15:0] ToDisplay,
        output logic [6:0]  CurrentState
    );

    logic reset;
    synchronizer sync(
        .i_clk     (clk),
        .i_PB      (~resetN),
        .o_PB_sync (reset)
    );

    logic pressed;
    logic dummy1, dummy2; // solo son para evitar el warning
    debouncer_FSM #(N_debouncer) status_button( //revisar instancia
        .clk               (clk),
        .rst               (reset),
        .PB                (Enter),
        .PB_pressed_status (dummy1),
        .PB_released_pulse (dummy2),
        .PB_pressed_pulse  (pressed)
    );

    logic pressed_undo;  
    logic dummy3, dummy4; // solo son para evitar el warning
    debouncer_FSM #(N_debouncer) status_button_undo( //revisar instancia
        .clk               (clk),
        .rst               (reset),
        .PB                (Undo),
        .PB_pressed_status (dummy3),
        .PB_released_pulse (dummy4),
        .PB_pressed_pulse  (pressed_undo)
    );


    logic        displaySel;
    logic [15:0] DataOut;
    polish_calculator_undo #(.WIDTH(16)) pol_cal (
        .clk          (clk),
        .reset        (reset),
        .Enter        (pressed),
        .Undo         (pressed_undo),
        .DataIn       (DataIn),
        .DataOut      (DataOut),
        .CurrentState (CurrentState),
        .toDisplaySel (displaySel),
        .Flags        (Flags)
    );

    display_selector selector(
        .i_selector   (displaySel),
        .i_data_in    (DataIn),
        .i_result     (DataOut),
        .o_to_display (ToDisplay)
    );

endmodule