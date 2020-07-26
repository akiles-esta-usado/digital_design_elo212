module reg_ALU_display #(parameter WIDTH=8)(
        input  logic             clk, reset,
        input  logic [WIDTH-1:0] data_in,
        input  logic             load_A, load_B, load_Op, update_Res,
        output logic [6:0]       segments,
        output logic [7:0]       anodes
    );

    logic [WIDTH-1:0] result_to_7seg;

    hex_to_7seg #(.N(WIDTH)) to_7seg (
        .clk      (clk),
        .reset    (reset),
        .BCD_in   (result_to_7seg),
        .anodos   (anodes),
        .segments (segments)
    );

    reg_ALU #( .WIDTH(WIDTH)) ALU_inst (
        .i_clk        (clk),
        .i_reset      (reset),
        .i_A          (data_in),
        .i_B          (data_in),
        .i_load_A     (load_A),
        .i_load_B     (load_B),
        .i_load_Op    (load_Op),
        .i_update_Res (update_Res),
        .i_OpCode     (data_in[1:0]),
        .o_Result     (result_to_7seg)
    );

endmodule