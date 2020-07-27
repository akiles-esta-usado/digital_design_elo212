module reg_ALU_datain #(parameter WIDTH=8)(
        input  logic             i_clk, i_reset,
        input  logic [WIDTH-1:0] i_data_in,
        input  logic             i_load_A, i_load_B, i_load_Op, i_update_Res,
        output logic [WIDTH-1:0] o_data_out
    );
    logic [3:0] flags;

    reg_ALU #(.WIDTH(WIDTH)) ALU_inst (
        .i_clk        (i_clk),
        .i_reset      (i_reset),
        .i_A          (i_data_in),
        .i_B          (i_data_in),
        .i_OpCode     (i_data_in[1:0]),
        .i_load_A     (i_load_A),
        .i_load_B     (i_load_B),
        .i_load_Op    (i_load_Op),
        .i_update_Res (i_update_Res),
        .o_Result     (o_data_out)
    );

endmodule