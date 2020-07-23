//Timed Moore machine 

// Module header:-----------------------------
module module_name #(parameter param1 = <value>, 
                               param2 = <value> ) (
        input 	logic clk, rst, ...
        input 	logic [7:0] inp1, inp2, ...
        output 	logic [15:0] outp1, outp2, ...
    );

//Declarations:------------------------------

//FSM states type:
typedef enum logic [10:0] {A, B, C, ...} state;
state pr_state, nx_state;

//Timer-related declarations:
const logic [7:0] T1   = <value> ;
const logic [7:0] T2   = <value> ;
const logic [7:0] T3   = <value> ;
const logic [7:0] tmax = <value> ; //tmax ≥ max(T1,T2,...) - 1
logic       [7:0] t;

//Part 3: Statements:---------------------------------------

//Timer :
always_ff @(posedge clk) begin
	if      (rst)                  t <= 0;
	else if (pr_state != nx_state) t <= 0;     // reset the timer when state changes
	else if (t < tmax)             t <= t + 1;
	else                           t <= tmax;  // No genera latch el hecho de ignorar este else? ¿Esto pararía el contador? (si?)
end

//FSM state register:
always_ff @(posedge clk) begin
	if (rst) pr_state <= A;
	else     pr_state <= nx_state;
end
 
// FSM next state combinational logic:
// Como representamos los timers en diagramas de moore??
always_comb begin
    nx_state = pr_state;

    // ¿Porqué t tiene que ser mayor o igual a TN-1?
    // ¿eso añade hardware innecesario?
	case (pr_state)
		A: begin
			if      (... and t >= T1-1) nx_state = B;
			else if (... and t >= T2-1) nx_state = ...;
		end

		B: begin
			if      (... and t >= T3-1) nx_state = C;
			else if (...)               nx_state = ...;
		end

		...
	endcase
end

//FSM output combinational logic:
always_comb begin
	case (pr_state)
		A: begin
			outp1 = <value> ;
			outp2 = <value> ;
			...
		end
 
		B: begin
			outp1 = <value> ;
			outp2 = <value> ;
			...
		end
		
        ...
	endcase
end

//Optional output register (if required). Adds a FF at the output to prevent the propagation of glitches from comb. logic.
always_ff @(posedge clk) begin
    if (rst) begin //rst might be not needed here
        exterior_outp1 <= ...;
        exterior_outp2 <= ...; ...
    end
    else begin
        exterior_outp1 <= outp1;
        exterior_outp2 <= outp2; ...
    end
end

endmodule