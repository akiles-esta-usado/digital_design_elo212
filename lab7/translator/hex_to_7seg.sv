`timescale 1ns / 1ps

module hex_to_7seg
    #(parameter N = 32)
    (
        input  logic         clk, reset,
        input  logic [N-1:0] BCD_in,
        output logic [6:0]   segments,
        output logic [7:0]   anodos
    );

    localparam N_BLOCKS = int'( $ceil( real'(N) * 0.25));

    logic [3:0] current_BCD_block;  // Subgrupo de 4 bits que serán convertidos
    logic [2:0] select;             // cantidad que indica qué bloque de bits mostrar

    logic [31:0] mux_in;    // Esto representa todas las entradas del mux, solamente ocuparemos N de estas

    always_comb begin
        mux_in = 32'd0;
        mux_in[N-1:0] = BCD_in;
    end

    mux #(.N_IN(8), .WIDTH(4)) mux_BCD_in (
        .i_d (mux_in),
        .i_s (select),
        .o_y (current_BCD_block)
    );

    counter_N #(.N(3)) counter_block (
        .clk  (clk),
        .reset(reset),
        .count(select)
    );

    BCD_to_seven_seg BCD_convertor(
        .i_BCD(current_BCD_block),
        .o_seven_seg(segments)
        );
    
    decoder_one_cold #(3) decoder_inst (
        .i_a (select),
        .o_y (anodos)
    );

endmodule
