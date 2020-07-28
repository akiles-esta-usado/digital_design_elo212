module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        input  logic        Enter, Undo, DisplayFormat,
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [6:0]  CurrentState,
        output logic [6:0]  Segments, // Segments[0] = CA -> {CG, ..., CA}
        output logic [4:0]  Anodes    // Anodes[0] = AN0  -> {AN3, AN2, AN1, AN0}
    );

    logic [15:0] toTranslator;

    Act2_RPCalculator RPCalc_inst (
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
    // y solo genera un sincronizador.
    logic reset;
    synchronizer sync(
        .i_clk     (clk),
        .i_PB      (~resetN),
        .o_PB_sync (reset)
    );


    translator translator_inst (
        .i_clk           (clk),
        .i_reset         (reset),
        .i_currentState  (CurrentState),
        .i_displayFormat (DisplayFormat),
        .i_toDisplay_bin (toTranslator),
        .o_segments      (Segments),
        .o_anodes        (Anodes)
    );

endmodule
