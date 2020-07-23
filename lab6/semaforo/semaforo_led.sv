module semaforo_led(
        input  logic i_clk, i_reset,
        input  logic i_btn_TA, i_btn_TB,
        output logic o_led_A_r, o_led_A_g, o_led_A_b,
        output logic o_led_B_r, o_led_B_g, o_led_B_b
    );

    logic [1:0] color_A;
    logic [1:0] color_B;

    semaforo sem_inst (
        .clock (i_clk),
        .reset (i_reset),
        .TA    (i_btn_TA),
        .TB    (i_btn_TB),
        .LA    (color_A),
        .LB    (color_B)
    );

    to_tricolor tricolor_A (
        .i_color(color_A),
        .o_led_r(o_led_A_r),
        .o_led_g(o_led_A_g),
        .o_led_b(o_led_A_b)
    );

    to_tricolor tricolor_B (
        .i_color(color_B),
        .o_led_r(o_led_B_r),
        .o_led_g(o_led_B_g),
        .o_led_b(o_led_B_b)
    );

endmodule