module top_level_to_pulse (
        input  logic       CLK100MHZ, CPU_RESETN,
        input  logic       BTNC,
        output logic [1:0] LED
);

    level_to_pulse to_pulse_inst (
        .i_clk      (CLK100MHZ),
        .i_reset    (CPU_RESETN),
        .i_in       (BTNC),
        .o_rise_out (LED[0]),
        .o_fall_out (LED[1])
    );

endmodule