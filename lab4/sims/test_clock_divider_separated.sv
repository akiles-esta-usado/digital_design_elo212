
module clock_divider_separated
    #(parameter COUNTER_MAX = 32)
    (
        input  logic i_clk, i_reset,
        output logic o_clk
    );

    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    
    logic [DELAY_WIDTH-1:0] counter = 'd0;
    logic [DELAY_WIDTH-1:0] counter_next;
    logic clk_next;

    // Lógica del contador
    always_comb begin
        if (counter == COUNTER_MAX - 1) begin
            counter_next = 'd0;
        end

        else begin
            counter_next = counter + 'd1;
        end
    end

    // Lógica de la salida o_clk
    always_comb begin
        if (counter == COUNTER_MAX-1) begin
            clk_next = ~o_clk;
        end

        else begin
            clk_next = o_clk;
        end

    end

    // Lógica secuencial
    always_ff @(posedge i_clk) begin
        if (i_reset == 1'b1) begin
            counter <= 'd0;
            o_clk   <= 0;
        end

        else begin
            counter <= counter_next;
            o_clk   <= clk_next;
        end
    end

endmodule