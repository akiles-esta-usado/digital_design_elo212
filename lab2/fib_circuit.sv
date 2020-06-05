`timescale 1ns / 1ps

module fib_circuit(
        input  logic       i_clk, i_reset,
        output logic       o_fib, o_display_on,
        output logic [7:0] o_sevenSeg);

    logic [3:0] count;

    always_ff @(posedge i_clk) begin
        if (i_reset) begin
            o_display_on <= 1'b0;
        end
        else begin 
            o_display_on <= 1'b1;
        end
    end

    counter_4 counter(i_clk, i_reset, count);

    BCD_to_seven_seg to_7seg (count, o_sevenSeg);

    fib_rec fib(count, o_fib);

endmodule

