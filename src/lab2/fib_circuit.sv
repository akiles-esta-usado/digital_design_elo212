`timescale 1ns / 1ps

module fib_circuit(
        input  logic       i_clk, i_reset,
        output logic       o_fib, o_display_on,
        output logic [7:0] o_sevenSeg);

    logic [3:0] count;

    assign o_display_on = 1;

    counter_4 counter(i_clk, i_reset, count);

    BCD_to_sevenSeg to_7seg (count, o_sevenSeg);

    fib_rec fib(count, o_fib);

endmodule

