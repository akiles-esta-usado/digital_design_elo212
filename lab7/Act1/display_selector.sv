module display_selector(
        input  logic        i_selector,
        input  logic [15:0] i_data_in,
        input  logic [15:0] i_result,
        output logic [15:0] o_to_display
    );

    assign o_to_display = (i_selector == 'd0) ? i_data_in : i_result;

endmodule