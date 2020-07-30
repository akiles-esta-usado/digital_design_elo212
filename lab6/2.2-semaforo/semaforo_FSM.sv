// Obtenido del repositorio de ELO212

module semaforo(
	input  logic       clock,
	input  logic       reset, TA, TB,
	output logic [1:0] LA, LB
    );

enum logic[3:0] {
    A_CROSSING, 
    A_TO_B, 
    B_CROSSING, 
    B_TO_A
} state, next_state;

//output encoding
localparam GREEN    = 2'b00;
localparam YELLOW   = 2'b01;
localparam RED      = 2'b10;

always_comb begin
    next_state = state;
    
    case (state)
        A_CROSSING: if(TA == 1'b0) next_state = A_TO_B;
        A_TO_B:                    next_state = B_CROSSING;
        B_CROSSING: if(TB == 1'b0) next_state = B_TO_A;
        B_TO_A:                    next_state = A_CROSSING;
    endcase
end	

always_comb begin
    LA = RED;
    LB = RED;

    case (state)
        A_CROSSING: LA = GREEN;
        A_TO_B:     LA = YELLOW;
        B_CROSSING: LB = GREEN;
        B_TO_A:     LB = YELLOW;
    endcase

end

//when clock ticks, update the state
always_ff @(posedge clock) begin
    if   (reset) state <= A_CROSSING;
    else         state <= next_state;
end
endmodule
