/*
    Este modulo realiza la convesión de formato binario a BCD
 */

module translator_conversion #(parameter STATE_BITS = 8) (
        input  logic                  i_clk, i_reset,
        input  logic [STATE_BITS-1:0] i_currentState,
        input  logic [15:0]           i_toDisplay_bin,
        output logic [19:0]           o_bcd
    );

    logic update;

    logic [STATE_BITS-1:0] pr_state;
    logic [STATE_BITS-1:0] nx_state;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            pr_state <= 'd0;
        end
        else begin
            pr_state <= nx_state;
        end
    end

    always_comb begin
        nx_state = pr_state;
        update   = (pr_state != i_currentState) ? 1'b1 : 1'b0 ;
        nx_state = i_currentState;
    end

    logic trigger;
    logic idle; // de unsigned_to_bcd
    translator_internal_fsm fsm(
        .i_clk     (i_clk), 
        .i_reset   (i_reset),
        .i_update  (update),
        .i_idle    (idle),
        .o_trigger (trigger)
    );

    logic [31:0] bcd_wrapper;
    logic [31:0] in_wrapper;

    always_comb begin
        in_wrapper       = 'd0;
        in_wrapper[15:0] = i_toDisplay_bin;
    end

    unsigned_to_bcd to_bcd_inst(
        .clk     (i_clk),
        .trigger (trigger),
        .in      (in_wrapper),
        .bcd     (bcd_wrapper),
        .idle    (idle)
    );

    assign o_bcd = bcd_wrapper[19:0];

endmodule