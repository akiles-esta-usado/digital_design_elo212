typedef enum logic [3:0] {
    S0,
    S1,
    S2,
    S3
} state_t; 

typedef enum logic [2:0] {
    GREEN, 
    RED, 
    YELLOW
} color_t;


module semaphore(
        input  logic   i_clk, i_reset,
        input  logic   i_TA, i_TB,
        output color_t o_LA, o_LB
    );


    state_t state, next_state;

    always_ff @(posedge i_clk) begin

        if(i_reset) begin
            state <= S0;
        end

        else begin
            state <= next_state;
        end
    end


    always_comb begin
        next_state = S0;
        o_LA = GREEN;
        o_LB = RED;

        case(state) begin
            S1: begin
                o_LA = YELLOW;
                o_LB = RED;
                next_state = S2;
            end
        endcase
    end
endmodule
