module syncronizer(
        input  logic i_clk, i_reset,
        input  logic i_PB,
        output logic o_PB_sync
);

    logic PB_sync_aux;

    // Double flopping stage for synchronizing asynchronous PB input signal
    // PB_sync is the synchronized signal
    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            PB_sync_aux <= 1'b0;
            o_PB_sync   <= 1'b0;
        end
        else begin
            PB_sync_aux <= i_PB;
            o_PB_sync   <= PB_sync_aux;
        end
    end

endmodule