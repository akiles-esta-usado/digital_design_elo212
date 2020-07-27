module Act1_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, // La N viene de NEGADO
        input  logic        Enter, //PB
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags, // [3:0] = {N, Z, C, V}
        output logic [15:0] ToDisplay,
        output logic [4:0]  CurrentState
    );


    logic reset;
    synchronizer sync(
        .i_clk     (clk),
        .i_PB      (~resetN),
        .o_PB_sync (reset)
    );

    PB_Debouncer_FSM #(N_debouncer) status_button( //revisar instancia
        .clk              (clk),
        .rst              (rst),
        .PB               (Enter),
        .PB_pressed_pulse (pressed)
    );

    polish_calculator #(.WIDTH(16)) pol_cal (
        .clk    (clk),
        .reset  (resetN),
        .Enter  (pressed),
        .DataIn (DataIn)
    );

endmodule

