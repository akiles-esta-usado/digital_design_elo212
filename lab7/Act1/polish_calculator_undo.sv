module polish_calculator_undo #(parameter WIDTH = 16) (
        input  logic             clk, reset,
        input  logic             Enter, Undo,
        input  logic [WIDTH-1:0] DataIn,
        output logic [WIDTH-1:0] DataOut,
        output logic [3:0]       CurrentState,
        output logic             toDisplaySel

    );

    logic load_A, load_B, load_Op, update_Res; // esta bien tratarlos como salidas en FSM? 

    typedef enum logic [3:0] {
        Wait_OPA,
        Wait_OPB,
        Wait_OpCode,
        Show_Result
    } state;

    (* fsm_encoding = "one_hot" *) state pr_state, nx_state;  

    always_ff @(posedge clk)
        if (reset) pr_state <= Wait_OPA;
        else       pr_state <= nx_state;

    reg_ALU_datain #(.WIDTH(WIDTH)) ALU_inst(
        .i_clk         (clk),
        .i_reset       (reset),
        .i_data_in     (DataIn),
        .i_load_A      (load_A),
        .i_load_B      (load_B), 
        .i_load_Op     (load_Op), 
        .i_update_Res  (update_Res),
        .o_data_out    (DataOut)
    );

    always_comb begin
        load_A       = 1'b0;
        load_B       = 1'b0;
        load_Op      = 1'b0;
        update_Res   = 1'b0;

        CurrentState = pr_state;

        case (pr_state)
            Wait_OPA: begin
                load_A       = 1'b1;
            end

            Wait_OPB: begin
                load_B       = 1'b1;
            end

            Wait_OpCode: begin
                load_Op      = 1'b1;
            end

            Show_Result: begin
                update_Res   = 1'b1;
                toDisplaySel = 1'b0;
            end
        endcase
    end

    // FSM Solo lógica de transición
    always_comb begin
        nx_state = pr_state;

        case (pr_state)
            Wait_OPA: begin
                if (Enter) nx_state = Wait_OPB;
            end

            Wait_OPB: begin
                if (Enter) nx_state = Wait_OpCode;
                else if (Undo) nx_state = Wait_OPA;
            end

            Wait_OpCode: begin
                if (Enter) nx_state = Show_Result;
                else if (Undo) nx_state = Wait_OPB;
            end

            Show_Result: begin
                if (Enter) nx_state = Wait_OPA;
                else if (Undo) nx_state = Wait_OpCode;
            end
        endcase
    end
endmodule


/*
## Act1
La calcualdora polaca y todo el sistema solo funcionan para ENTER

## Act2
Es la misma calculadora pero se añade la funcionalidad de UNDO

Yo creo que sería más sencillo definir bien la calculadora polaca 
y el sistema de ACT1 y luego hacemos un copypaste para Act2

Las diferencias deberían ser:
- Nueva entrada UNDO en ambos sistemas
- Otros IF's solo en la calculadora polaca

*/
