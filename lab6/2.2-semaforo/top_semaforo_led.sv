module top_semaforo_led(
        input  logic CLK100MHZ, CPU_RESETN,
        input  logic BTNL, BTNR,
        output logic LED16_B, LED16_G, LED16_R,
        output logic LED17_B, LED17_G, LED17_R
    );

    logic [1:0] color_A;
    logic [1:0] color_B;

    semaforo_led sem_inst (
        .i_clk     (CLK100MHZ),
        .i_reset   (~CPU_RESETN),
        .i_btn_TA  (BTNL),
        .i_btn_TB  (BTNR),
        .o_led_A_r (LED16_R),
        .o_led_A_g (LED16_G),
        .o_led_A_b (LED16_B),
        .o_led_B_r (LED17_R),
        .o_led_B_g (LED17_G),
        .o_led_B_b (LED17_B)
    );

endmodule