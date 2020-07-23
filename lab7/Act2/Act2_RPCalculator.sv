module Act2_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, 
        inpit  logic        Enter, Undo,
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags, // [3:0] = {N, Z, C, V}
        output logic [15:0] ToDisplay,
        output logic [x:0]  CurrentState;
    );

    logic reset;
    assign reset = ~resetN;

    typedef enum logic [10:0] {Wait_OPA, Wait_OPB, Wait_OpCode, Show_Result} state;
    state pr_state, nx_state;

endmodule;