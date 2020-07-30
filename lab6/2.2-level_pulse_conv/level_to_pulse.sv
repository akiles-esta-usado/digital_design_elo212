// Module header:-----------------------------
module level_to_pulse (
	    input 	logic i_clk, i_reset,
	    input 	logic i_in,
	    output 	logic o_rise_out, o_fall_out
    );

    typedef enum logic [3:0] {
        DOWN,
        RISE,
        UP,
        FALL
    } state_t;

    (* fsm_encoding = "one_hot" *) state_t pr_state, nx_state;

    //FSM state register:
    always_ff @(posedge i_clk) begin
        if   (i_reset) pr_state <= DOWN;
        else           pr_state <= nx_state;
    end

    //FSM next state combinational logic:
    always_comb begin
        nx_state = pr_state;

        case (pr_state)
            DOWN: begin
                if (i_in == 1'b1) nx_state = RISE;
            end

            RISE: begin
                if      (i_in == 1'b0) nx_state = FALL;
                else if (i_in == 1'b1) nx_state = UP;
            end

            UP: begin
                if      (i_in == 1'b0) nx_state = FALL;
            end

            FALL: begin
                if      (i_in == 1'b0) nx_state = DOWN;
                else if (i_in == 1'b1) nx_state = RISE;
            end

        endcase
    end

    //FSM output combinational logic:
    always_comb begin
        case(pr_state)
            FALL: begin
                o_fall_out = 1'b1;
                o_rise_out = 1'b0;
            end

            RISE: begin
                o_fall_out = 1'b0;
                o_rise_out = 1'b1;
            end

            default: begin
                o_fall_out = 1'b0;
                o_rise_out = 1'b0;
            end
        endcase
    end

endmodule