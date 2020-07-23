

localparam period         = 10;           // duración de un periodo
localparam test_duration  = 40  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset


module tb_semaforo_led();
    timeunit      1ns;
    timeprecision 1ps;

	logic clk;
	logic reset;
    
    struct {
        logic led_r, led_g, led_b;
    } tricolor_A, tricolor_B;

	logic TA, TB;

	// an instance of the Device Under Test
	semaforo_led DUT (
        .i_clk     (clk),
        .i_reset   (reset),
        .i_btn_TA  (TA),
        .i_btn_TB  (TB),
        .o_led_A_r (tricolor_A.led_r),
        .o_led_A_g (tricolor_A.led_g),
        .o_led_A_b (tricolor_A.led_b),
        .o_led_B_r (tricolor_B.led_r),
        .o_led_B_g (tricolor_B.led_g),
        .o_led_B_b (tricolor_B.led_b)
    );
	// generate a clock signal that inverts its value every five time units
	initial begin
        #(reset_duration);

        // Cambio a B Crossing
        TA = 0;
        TB = 1;

        # (4*period);

        // Cambio a A Crossing
        TA = 1;
        TB = 0;

        # (4*period);

        // Verificación del caso en que hay tráfico en ambos sentidos
        TA = 1;
        TB = 1;

        # (8*period);

        // Verificación del caso en que no hay tráfico
        TA = 0;
        TB = 0;

        # (8*period);


        // Finalizar
        reset = 1'b1;
        #(period);
        reset = 1'b1;
        #(3 * period);
        $finish;
	end


    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 1;
        reset = 1;

        #(reset_duration);
        reset = 0;
    end

    initial begin
        #(test_duration);
        $finish;
    end

endmodule
