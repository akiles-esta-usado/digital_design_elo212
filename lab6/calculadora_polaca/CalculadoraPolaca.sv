module CalculadoraPolaca #(parameter WIDTH=16)(
        input  logic             clk, rst,
        input  logic [WIDTH-1:0] data_in,             
        input  logic             PB, //boton
        output logic [WIDTH-1:0] o_Result

    );

    logic             i_load_A, i_load_B, i_load_Op, i_update_Res; //botones
    logic [WIDTH-1:0] ALU_A,      next_A;
    logic [WIDTH-1:0] ALU_B,      next_B;
    logic       [1:0] ALU_OpCode, next_OpCode;
    logic [WIDTH-1:0] ALU_Result, next_Result;
    logic             pressed, pressed_aux;
    logic [3:0] flags;
    
    ALU #(.WIDTH(WIDTH)) ALU_inst(
        .A(     ALU_A),
        .B(     ALU_B),
        .OpCode(ALU_OpCode),
        .Result(ALU_Result),
        .Status(flags)
    );
    PB_Debouncer_FSM #() status_button( //revisar instancia
        .clk(             clk),
        .rst(             rst),
        .PB(              PB),
        .PB_pressed_pulse(pressed)
    );

    typedef enum logic [4:0] {S0,S1,S2,S3,S4} state;
    state pr_state, nx_state;

    always_ff @(posedge clk) begin
     if (rst) begin
         pressed_aux <= 1'b0;
         pressed     <= 1'b0;
     end
     else begin
         pressed_aux <= PB;
         pressed     <= pressed_aux;
     end
    end

    always_ff @(posedge clk) begin
	    if (rst) pr_state < = S0;
	    else pr_state < = nx_state;
    end

    always_comb begin
        S0: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
			if (pressed) nx_state = S1;
			else nx_state = S0;
		end

        S1: begin

			i_load_A = 1'b1 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
			if (pressed) nx_state = S2;
			else nx_state = S1;
		end

        S2: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b1 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b0;
			if (pressed) nx_state = S3;
			else nx_state = S2;
		end

        S3: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b1;
            i_update_Res= 1'b0;
			if (pressed) nx_state = S4;
			else nx_state = S3;
		end

        S4: begin

			i_load_A = 1'b0 ;
			i_load_b = 1'b0 ;
            i_load_Op= 1'b0;
            i_update_Res= 1'b1;
			if (pressed) nx_state = S0;
			else nx_state = S4;
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


