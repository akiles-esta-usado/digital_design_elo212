`timescale 1ns / 1ps

module counter_4(
    input  logic        i_clk, i_reset,
    output logic [3:0]  o_count
    );

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            o_count <= 4'b0;
        end
        else begin
            o_count <= o_count+1;
        end
    end
endmodule
