module top_reg_ALU_display(
        input logic CLK100MHZ,
        input logic CPU_RESETN,
        input  logic [7:0] SW,
        output logic [7:0] AN,
        output logic CA, CB, CC, CD, CE, CF, CG
    );

    logic load_A;
    logic load_B;
    logic load_Op;
    logic update_Res;
    logic reset;

    logic [3:0] data_in;

    always_comb begin
        load_A     = SW[7];
        load_B     = SW[6];
        load_Op    = SW[5];
        update_Res = SW[4];
        data_in    = SW[3:0];
        reset      = ~CPU_RESETN;
    end

    reg_ALU_display #(.WIDTH(4))(
        .clk        (CLK100MHZ),
        .reset      (reset),
        .data_in    (data_in),
        .load_A     (load_A),
        .load_B     (load_B),
        .load_Op    (load_Op),
        .update_Res (update_Res),
        .segments   ({CG, CF, CE, CD, CC, CB, CA}),
        .anodes     (AN)
    );

endmodule