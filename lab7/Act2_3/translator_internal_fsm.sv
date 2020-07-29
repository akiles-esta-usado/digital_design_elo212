module translator_internal_fsm(
        input  logic i_clk, i_reset,
        input  logic i_update, i_idle,
        output logic o_trigger
    );


    typedef enum logic [2:0] {
        IDLE    = 'b001, 
        WAIT    = 'b010, 
        LOAD    = 'b100
    } state;
    state pr_state, nx_state;

    //FSM state register:
    always_ff @(posedge i_clk) begin
        if (i_reset) pr_state <= IDLE;
        else         pr_state <= nx_state;
    end

    // FSM next state combinational logic:
    always_comb begin
        nx_state = pr_state;

        case (pr_state)
            IDLE: begin
                if(i_update)  nx_state = WAIT;
            end

            WAIT: begin
                if(i_idle)  nx_state = LOAD;
            end

            LOAD: begin
                if(i_update) nx_state = WAIT;
                else         nx_state = IDLE;
            end

        endcase
    end

    //FSM output combinational logic:
    always_comb begin
        o_trigger = 'b0;

        if (pr_state == LOAD) o_trigger = 'd1;

    end

endmodule