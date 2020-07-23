module Act3_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        input  logic        Enter, Undo, DisplayFormat
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags,
        output logic [3:0]  CurrentState,
        output logic [6:0]  Segments, // Segments[0] = CA
        output logic [4:0]  Anodes    // Anodes[0] = AN0
    );

    Act2_RPCalculator RPCalculator_inst #(.N_debouncer(N_debouncer))(
        ...
    );

endmodule;