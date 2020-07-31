/*
    Este modulo realiza la convesión de formato binario a BCD
 */

module translator_conversion #(parameter STATE_BITS = 8) (
        input  logic                  i_clk, i_reset,
        input  logic [15:0]           i_toDisplay_bin,
        output logic [19:0]           o_bcd
    );

    logic update;

    /****************************************/
    /* Lógica de cambio de estado -> update */
    /****************************************/
    logic [15:0] pr_dataIn;
    logic [15:0] nx_dataIn;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            pr_dataIn <= 'd0;
        end
        else begin
            pr_dataIn <= nx_dataIn;
        end
    end

    always_comb begin
        nx_dataIn = pr_dataIn;
        update   = (pr_dataIn != i_toDisplay_bin) ? 1'b1 : 1'b0 ;
        nx_dataIn = i_toDisplay_bin;
    end

    /********************/
    /* Resto de módulos */
    /********************/

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