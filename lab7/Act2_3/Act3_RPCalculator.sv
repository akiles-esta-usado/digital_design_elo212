module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        input  logic        Enter, Undo, DisplayFormat,
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [7:0]  CurrentState,
        output logic [6:0]  Segments, // Segments[0] = CA -> {CG, ..., CA}
        output logic [4:0]  Anodes    // Anodes[0] = AN0  -> {AN3, AN2, AN1, AN0}
    );

    localparam STATE_BITS = 8;

    logic [15:0] toTranslator;

    // Este módulo se ocupa tal cual, no se modifica nada.
    Act2_RPCalculator  RPCalc_inst (
        .clk            (clk), 
        .resetN         (resetN), 
        .Enter          (Enter), 
        .Undo           (Undo),
        .DataIn         (DataIn),
        .Flags          (Flags), // [3:0] = {N, Z, C, V}
        .ToDisplay      (toTranslator),
        .CurrentState   (CurrentState)
    );

    // Nos aprovechamos de que Vivado es capaz de detectar esta redundancia 
    // y solo ocupa el sincronizado de Act2.
    logic reset;
    synchronizer sync(
        .i_clk     (clk),
        .i_PB      (~resetN),
        .o_PB_sync (reset)
    );
    
    // Señal DisplayFormat debe ser limpiada.
    logic DisplayFormat_clean;  
    logic dummy1, dummy2; // solo son para evitar el warning
    debouncer_FSM #(N_debouncer) status_button_undo(
        .clk               (clk),
        .rst               (reset),
        .PB                (DisplayFormat),
        .PB_pressed_status (DisplayFormat_clean),
        .PB_released_pulse (dummy1),
        .PB_pressed_pulse  (dummy2)
    );

    translator #(STATE_BITS) translator_inst (
        .i_clk           (clk),
        .i_reset         (reset),
        .i_displayFormat (DisplayFormat_clean),
        .i_toDisplay_bin (toTranslator),
        .o_segments      (Segments),
        .o_anodes        (Anodes)
    );

endmodule
