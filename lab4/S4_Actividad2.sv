`timescale 1ns / 1ps

module S4_Actividad2 (
    input  logic  clock_100M,
    input  logic  reset,

    output logic clock_out_50M,
    output logic clock_out_30M,
    output logic clock_out_10M,
    output logic clock_out_1M
);

clk_divider #(.clk_out(50)) clk_divider_50 (clock_100M, reset, clock_out_50M);
clk_divider #(.clk_out(30)) clk_divider_30 (clock_100M, reset, clock_out_30M);
clk_divider #(.clk_out(10)) clk_divider_10 (clock_100M, reset, clock_out_10M);
clk_divider #(.clk_out( 1)) clk_divider_1  (clock_100M, reset, clock_out_1M );

endmodule