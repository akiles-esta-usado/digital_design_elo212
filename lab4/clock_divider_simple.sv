`timescale 1ns/1ps

module clock_divider_simple
    #(parameter COUNTER_MAX = 4)
    (
        input  logic  i_clk, i_reset,
        output logic  o_clk
    );

    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter;

    always_ff @(posedge i_clk) begin
        
        if (i_reset == 1'b1) begin
            counter <= 'd0;
            o_clk   <= 1'b0;
        end

        else if (counter == COUNTER_MAX-1) begin
            counter <= 'd0;
            o_clk <= ~o_clk;
        end

        else begin
            counter <= counter + 'd1;
            o_clk <= o_clk;
        end

    end
endmodule
