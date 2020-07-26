module Act1_RPCalculator #(parameter N_debouncer = 10) (
        input  logic        clk, resetN, // La N viene de NEGADO
        input  logic        Enter, //PB
        input  logic [15:0] DataIn,
        output logic [3:0]  Flags, // [3:0] = {N, Z, C, V}
        output logic [15:0] ToDisplay,
        output logic [4:0]  CurrentState
    );

    logic reset;
    assign reset = ~resetN;

    typedef enum logic [4:0] {Wait_OPA, Wait_OPB, Wait_OpCode, Show_Result} state; //
    state pr_state, nx_state;

    logic             i_load_A, i_load_B, i_load_Op, i_update_Res; // esta bien tratarlos como salidas en FSM? 
    logic [WIDTH-1:0] ALU_A,      next_A;
    logic [WIDTH-1:0] ALU_B,      next_B;
    logic       [1:0] ALU_OpCode, next_OpCode;
    logic [WIDTH-1:0] ALU_Result, next_Result;
    logic             pressed, pressed_aux;
  ALU #(.WIDTH(WIDTH)) ALU_inst(
        .A(     ALU_A),
        .B(     ALU_B),
        .OpCode(ALU_OpCode),
        .Result(ALU_Result),
        .Status(flags)
    );
PB_Debouncer_FSM #(N_debouncer) status_button( //revisar instancia
        .clk(             clk),
        .rst(             rst),
        .PB(              Enter),
        .PB_pressed_pulse(pressed)
    );
    always_ff @(posedge clk) begin //Es necesario este always si esque ya esta en el de Debouncer?? 
     if (reset) begin
         pressed_aux <= 1'b0;
         pressed     <= 1'b0;
     end
     else begin
         pressed_aux <= PB;
         pressed     <= pressed_aux;
     end
    end

    always_ff @(posedge clk) begin
	    if (reset) pr_state < = Wait_OPA;
	    else pr_state < = nx_state;
    end

    always_comb begin
        Wait_OPA: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
            toDisplay=DataIn;
            CurrentState=4'b0001; //state Wait_OPA
			if (pressed) nx_state = Wait_OPB;
			else nx_state = Wait_OPA;
		end

        Wait_OPB: begin

			i_load_A = 1'b1 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
            toDisplay=DataIn;
            CurrentState=4'b0010;//state Wait_OPB
			if (pressed) nx_state = Wait_OpCode;
			else nx_state = Wait_OPB;
		end

        Wait_OpCode: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b1 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
            toDisplay=DataIn;
            CurrentState=4'b0100;//state Wait_OpCode
			if (pressed) nx_state = Show_Result;
			else nx_state = Wait_OpCode;
		end

        Show_Result: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b1;
            i_update_Res= 1'b0;
            toDisplay=DataIn;
            CurrentState=4'b1000; // state Show_result
			if (pressed) nx_state = Wait_OPA;
			else nx_state = Show_Result;
		end

endcase

        if(rst == 1'b1) begin
            ALU_A        <= {WIDTH {1'b0}};
            ALU_B        <= {WIDTH {1'b0}};
            ALU_OpCode   <=         2'b00;
            o_Result <= {WIDTH {1'b0}};
        end

        else begin
            ALU_A        <= next_A;
            ALU_B        <= next_B;
            ALU_OpCode   <= next_OpCode;
            o_Result <= next_Result;
        end

    end
endmodule
