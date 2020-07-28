module synchronizer(
        input  logic i_clk,
        input  logic i_PB,
        output logic o_PB_sync
);

    logic PB_sync_aux;

    // Double flopping stage for synchronizing asynchronous PB input signal
    // PB_sync is the synchronized signal
    always_ff @(posedge i_clk) begin
        PB_sync_aux <= i_PB;
        o_PB_sync   <= PB_sync_aux;
    end

endmodule