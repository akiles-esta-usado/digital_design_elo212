

module counter_to #(parameter COUNTER_MAX=15) (
        input  i_clk, i_reset,
        output [$clog2(COUNTER_MAX):0] o_count
    );

    always_ff @(posedge i_clk) begin
        
        if (i_reset == 1'b1) begin
            o_count <= 'd0;
        end

        else if (o_count == COUNTER_MAX) begin
            o_count <= 'd0;
        end

        else begin
            o_count <= o_count + 'd1;
        end

endmodule