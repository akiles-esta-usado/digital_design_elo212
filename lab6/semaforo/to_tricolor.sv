module to_tricolor (
        input  logic [1:0] i_color,
        output logic       o_led_r, o_led_g, o_led_b
    );

localparam GREEN    = 2'b00;
localparam YELLOW   = 2'b01;
localparam RED      = 2'b10;

always_comb begin
    o_led_r = 1'b0;
    o_led_g = 1'b0;
    o_led_b = 1'b0;

    case(i_color)
        GREEN: begin
            o_led_g = 1'b1;
        end

        RED: begin
            o_led_r = 1'b1;
        end

        YELLOW: begin
            o_led_g = 1'b1;
            o_led_r = 1'b1;
        end
    endcase
end

endmodule