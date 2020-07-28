module translator(
        input  logic        i_clk, i_reset,
        input  logic [3:0]  i_currentState,
        input  logic        i_displayFormat,
        input  logic [15:0] i_toDisplay_bin,
        output logic [6:0]  o_segments, // Segments[0] = CA -> {CG, ..., CA}
        output logic [4:0]  o_anodes    // Anodes[0] = AN0  -> {AN3, AN2, AN1, AN0}
    );

    logic [19:0] bcd_in;
    logic [19:0] toDisplay_bcd;

    translator_conversion conv(
        .i_clk           (i_clk),
        .i_reset         (i_reset),
        .i_currentState  (i_currentState),
        .i_toDisplay_bin (i_toDisplay_bin),
        .o_bcd           (toDisplay_bcd)
    );

    assign bcd_in = (i_displayFormat == 1'b1) ? toDisplay_bcd : {4'b0000, i_toDisplay_bin};

    // En el diagrama, estamos en la zona post mux (displayFormat)

    logic [7:0]  anodes_wrapper;
    hex_to_7seg #(.N(20)) to_7seg(
        .clk      (i_clk), 
        .reset    (i_reset),
        .BCD_in   (bcd_in),
        .segments (o_segments),
        .anodos   (anodes_wrapper)
    );

    assign o_anodes = anodes_wrapper[4:0];

endmodule