module reg_ALU #(parameter WIDTH=8)(
        input  logic             i_clk, i_reset,
        input  logic [WIDTH-1:0] i_A, i_B,
        input  logic             i_load_A, i_load_B, i_load_Op, i_update_Res,
        input  logic [1:0]       i_OpCode,
        output logic [WIDTH-1:0] o_Result
    );

    logic [WIDTH-1:0] ALU_A,      next_A;
    logic [WIDTH-1:0] ALU_B,      next_B;
    logic       [1:0] ALU_OpCode, next_OpCode;
    logic [WIDTH-1:0] ALU_Result, next_Result;

    logic [3:0] flags;

    ALU #(.WIDTH(WIDTH)) ALU_inst(
        .A(     ALU_A),
        .B(     ALU_B),
        .OpCode(ALU_OpCode),
        .Result(ALU_Result),
        .Status(flags)
    );

    always_comb begin
        next_A      = (i_load_A)             ? i_A        : ALU_A;
        next_B      = (i_load_B)             ? i_B        : ALU_B;
        next_OpCode = (i_load_Op)            ? i_OpCode   : ALU_OpCode;
        next_Result = (i_update_Res == 1'b1) ? ALU_Result : o_Result;
    end

    always_ff @(posedge i_clk) begin

        if(i_reset == 1'b1) begin
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