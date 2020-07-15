`timescale 1ns / 1ps

//Implementation of the traffic light example from Chapter 3 of the book
// Digital Design and Computer Architecture, of Sara Harris

typedef enum logic [1:0] {STATE_0, STATE_1, STATE_2, STATE_3} state_t;
typedef enum logic [1:0] {GREEN, YELLOW, RED} color_t;

module semaforo_FSM(
	input  logic       clock,
	input  logic       reset, TA, TB,
	output color_t     LA, LB
    );
    
    state_t state, next_state;  // setea una direccion y espera 

    always_ff @(posedge clock) begin
    	if(reset) begin
    		state <= STATE_0;
        end
    	else begin
    		state <= next_state;
        end
    end

    
    always_comb begin
        next_state = state;
    	
    	case (state)
    		STATE_0: begin
    			     if(TA == 1'b0) begin
    			 	   next_state = STATE_1;
    		         end
    		    end

            STATE_1: begin
                    next_state = STATE_2;
                end
            
            STATE_2: begin
                    if(TB == 1'b0) begin
                        next_state = STATE_3;
                    end
                end

            STATE_3: begin
                    if(TB == 1'b0) begin
                        next_state = STATE_0;
                    end
                end                
    	endcase
    end	

    // Output Colors Logic
    always_comb begin
    	LA = RED;
    	LB = RED;
    	
    	case (state)
    		STATE_0: begin
    			    LA = GREEN;
    		    end

            STATE_1: begin
                    LA = YELLOW;
                end
            
            STATE_2: begin
                    LB = GREEN;
                end

            STATE_3: begin
                    LB = YELLOW;
                end                
    	endcase
    end	

endmodule