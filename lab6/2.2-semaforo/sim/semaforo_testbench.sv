localparam period         = 10;           // duración de un periodo
localparam test_duration  = 40  * period; // duración máxima del test
localparam reset_duration = 3.2 * period; // duración del reset


module tb_semaforo();
    timeunit      1ns;
    timeprecision 1ps;

	logic clock;
	logic reset;
	logic TA, TB;
	
	logic [1:0] LA, LB;
	
	// an instance of the Device Under Test
	semaforo DUT (
        .clock (clock),
        .reset (reset),
        .TA (TA),
        .TB (TB),
        .LA (LA),
        .LB (LB)
    );
	// generate a clock signal that inverts its value every five time units
	initial begin
        #(reset_duration)

        // CAmbio a B Crossing
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

    always #(period*0.5) clock = ~clock;

    initial begin
        clock   = 1;
        reset = 1;

        #(reset_duration);
        reset = 0;
    end

    initial begin
        #(test_duration);
        $finish;
    end

endmodule
