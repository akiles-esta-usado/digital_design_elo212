module PB_Debouncer_counter #(parameter DELAY=15 ) (// Number of clock pulses to check stable button pressing
        input 	logic clk, reset,
        input 	logic PB,                   // Señal asíncrona que proviene directamente del botón mecánico
        output 	logic PB_pressed_status,    // Pulso sincronizado que indica 'botón presionado'
        output  logic PB_pressed_pulse,     // Alto si el botón está presionado
        output  logic PB_released_pulse     // Pulso sincronizado que indica 'botón liberado'
    );
	
	logic PB_sync;

    synchronizer sync(
        .i_clk      (clk),
        .i_reset    (reset),
        .i_PB       (PB),
        .o_PB_sync  (PB_sync)
    );

    localparam DELAY_WIDTH = $clog2(DELAY);   // Determine the size of the clock cycles counter
    
    logic [DELAY_WIDTH-1:0] delay_timer;
    logic PB_IDLE;
    logic PB_COUNT_MAX;
// When the push-button is pushed or released, increment the counter
// The counter has to be maxed out before we decide that the push-button state has changed

    assign PB_IDLE      = (PB_pressed_status==PB_sync);
    assign PB_COUNT_MAX = &delay_timer;	// true when all bits of delay_timer are 1's (counter has maxed out)

    always_ff @(posedge clk) begin
        if (reset) begin
            PB_pressed_status <= 1'b0;
        end
        else
            if(PB_IDLE)
                delay_timer <= 0;  // nothing's going on
            else begin
                delay_timer <= delay_timer + 'd1;  // something's going on, increment the counter
                if(PB_COUNT_MAX) PB_pressed_status <= ~PB_pressed_status;  // if the counter is maxed out, PB changed!
            end
     end

    // logic to generate pressed and released pulses
    assign PB_pressed_pulse  = ~PB_IDLE & PB_COUNT_MAX & ~PB_pressed_status; 
    assign PB_released_pulse = ~PB_IDLE & PB_COUNT_MAX &  PB_pressed_status;

endmodule