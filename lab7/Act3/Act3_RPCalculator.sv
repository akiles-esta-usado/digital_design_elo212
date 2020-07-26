module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        input  logic        Enter, Undo, DisplayFormat,
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [STATE_BITS-1:0]  CurrentState,
        output logic [6:0]  Segments, // Segments[0] = CA -> {CG, ..., CA}
        output logic [4:0]  Anodes    // Anodes[0] = AN0  -> {AN3, AN2, AN1, AN0}
    );

    logic toTranslator;

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

    translator translator_inst (
        .clk           (clk),
        .reset         (reset),
        .DisplayFormat (DisplayFormat)
        .ToDisplay     (toTranslator),
        .Segments      (Segments),
        .Anodes        (Anodes),
    );

endmodule