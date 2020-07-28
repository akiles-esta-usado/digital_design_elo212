module translator_internal_fsm(
        input  logic i_clk, i_reset,
        input  logic i_update,
        output logic o_trigger
    );


    typedef enum logic [3:0] {
        IDLE    = 'b0001, 
        WAIT    = 'b0010, 
        WAITING = 'b0100, 
        LOAD    = 'b1000
    } state;
    state pr_state, nx_state;

    // Timer-related declarations:

    // Aquí nos aprovechamos de que unsigned_to_bcd no tarda más de 63 periodos 
    // en convertir un dígito, entonces hay que esperar eso como máximo para que
    // vuelva a IDLE y poder actualizar el dato.

    const logic [7:0] tmax = 65;
    logic       [7:0] t;

    //FSM state register:
    always_ff @(posedge i_clk) begin
        if (i_reset) pr_state <= IDLE;
        else         pr_state <= nx_state;
    end

    always_ff @(posedge i_clk) begin
        if      (i_reset)                t <= 0;
        else if (pr_state == WAIT)     t <= 0;
        else if (pr_state == WAITING)  t <= t + 1;
    end

    
    // FSM next state combinational logic:
    always_comb begin
        nx_state = pr_state;

        case (pr_state)
            IDLE: begin
                if(i_update)  nx_state = WAIT;
            end

            WAIT: begin
                if(i_update)  nx_state = WAIT;
                else          nx_state = WAITING;
            end

            WAITING: begin
                if(i_update)        nx_state = WAIT;
                else if (t == tmax) nx_state = LOAD;
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