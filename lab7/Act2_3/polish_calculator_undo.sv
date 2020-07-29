module polish_calculator_undo #(parameter WIDTH = 16, STATE_BITS = 8) (
        input  logic                  clk, reset,
        input  logic                  Enter, Undo,
        input  logic [WIDTH-1:0]      DataIn,
        output logic [WIDTH-1:0]      DataOut,
        output logic [STATE_BITS-1:0] CurrentState,
        output logic                  toDisplaySel,
        output logic [3:0]            Flags
    );

    logic load_A, load_B, load_Op, update_Res; // esta bien tratarlos como salidas en FSM? 

    typedef enum logic [STATE_BITS-1:0] {
        Wait_OPA    = 'b00000001,
        Load_OPA    = 'b00000010,
        Wait_OPB    = 'b00000100,
        Load_OPB    = 'b00001000,
        Wait_OpCode = 'b00010000,
        Load_OpCode = 'b00100000,
        Load_Result = 'b01000000,
        Show_Result = 'b10000000
    } state;

    (* fsm_encoding = "one_hot" *) state pr_state;  
    state nx_state;  


    reg_ALU #(.WIDTH(WIDTH)) ALU_inst (
        .i_clk        (clk),
        .i_reset      (reset),
        .i_A          (DataIn),
        .i_B          (DataIn),
        .i_OpCode     (DataIn[1:0]),
        .i_load_A     (load_A),
        .i_load_B     (load_B),
        .i_load_Op    (load_Op),
        .i_update_Res (update_Res),
        .o_Result     (DataOut),
        .o_Flags      (Flags)
    );

    // FSM actualización
    always_ff @(posedge clk) begin
        if (reset) pr_state <= Wait_OPA;
        else       pr_state <= nx_state;
    end

    // Lógica de salidas
    always_comb begin
        load_A       = 1'b0;
        load_B       = 1'b0;
        load_Op      = 1'b0;
        update_Res   = 1'b0;
        toDisplaySel = 1'd0;

        CurrentState = pr_state;


        case (pr_state)
            Load_OPA: begin
                load_A       = 1'b1;
            end

            Load_OPB: begin
                load_B       = 1'b1;
            end

            Load_OpCode: begin
                load_Op      = 1'b1;
            end

            Load_Result: begin
                update_Res   = 1'b1;
            end

            Show_Result: begin
                toDisplaySel = 1'b1;
            end

        endcase
    end

    // FSM lógica de transición
    // Enter tiene preferencia sobre el boton Undo                              
    always_comb begin
        nx_state = pr_state;

        case (pr_state)
            Wait_OPA: begin
                if (Enter) nx_state = Load_OPA;
            end

            Load_OPA: begin
                nx_state = Wait_OPB;
            end

            Wait_OPB: begin
                if (Enter) nx_state = Load_OPB;
                else if (Undo) nx_state = Wait_OPA;
            end

            Load_OPB: begin
                nx_state = Wait_OpCode;
            end

            Wait_OpCode: begin
                if (Enter) nx_state = Load_OpCode;
                else if (Undo) nx_state = Wait_OPB; 
            end

            Load_OpCode: begin
                nx_state = Load_Result;
            end

            Load_Result: begin
                nx_state = Show_Result;
            end

            Show_Result: begin
                if (Enter) nx_state = Wait_OPA;
                else if (Undo) nx_state = Wait_OpCode; 
            end

        endcase

    end
endmodule
