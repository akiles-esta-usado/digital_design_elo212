`timescale 1ns / 1ps

module mux #(  parameter N_IN = 6, WIDTH  = 8) 
    (
        input  logic [N_IN-1:0] [WIDTH-1:0]        i_d,
        input  logic            [$clog2(N_IN)-1:0] i_s,
        output logic            [WIDTH-1:0]        o_y
    );

    always_comb begin
        o_y = 'd0;
        o_y = i_d[i_s];
    end

endmodule


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


module counter_N #(parameter N=4)(
    input  logic          clk, reset,
    output logic [N-1:0]  count
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 'b0;
        end
        else begin
            count <= count+1;
        end
    end
endmodule

module decoder_one_cold #(N=3) (
        input  logic [N-1   :0] i_a,
        output logic [2**N-1:0] o_y);

    always_comb begin
        o_y      = {2**N{1'b1}};  // todas las salidas tendrán este valor
        o_y[i_a] = 1'b0;  // menos la que sea indicada por la entrada.
    end

endmodule

module BCD_to_seven_seg(
    input  logic [3:0] i_BCD,
    output logic [6:0] o_seven_seg
    );

    always_comb begin
        o_seven_seg              = 'b_111_1111; // 7F

        case (i_BCD)            // 'b_GFE_DCBA;
            'h0:     o_seven_seg = 'b_100_0000; // 40
            'h1:     o_seven_seg = 'b_111_1001; // 79
            'h2:     o_seven_seg = 'b_010_0100; // 24
            'h3:     o_seven_seg = 'b_011_0000; // 30
            'h4:     o_seven_seg = 'b_001_1001; // 19
            'h5:     o_seven_seg = 'b_001_0010; // 12
            'h6:     o_seven_seg = 'b_000_0010; // 02
            'h7:     o_seven_seg = 'b_111_1000; // 78
            'h8:     o_seven_seg = 'b_000_0000; // 00
            'h9:     o_seven_seg = 'b_001_1000; // 18
            'ha:     o_seven_seg = 'b_000_1000; // 08
            'hb:     o_seven_seg = 'b_000_0011; // 03
            'hc:     o_seven_seg = 'b_100_0110; // 46
            'hd:     o_seven_seg = 'b_010_0001; // 21
            'he:     o_seven_seg = 'b_000_0110; // 06
            'hf:     o_seven_seg = 'b_000_1110; // 0E
        endcase
    end
endmodule

//  0  <-> 40
//  1  <-> 79
//  2  <-> 24
//  3  <-> 30
//  4  <-> 19
//  5  <-> 12
//  6  <-> 02
//  7  <-> 78
//  8  <-> 00
//  9  <-> 18
//  a  <-> 08
//  b  <-> 03
//  c  <-> 46
//  d  <-> 21
//  e  <-> 06
//  f  <-> 0E
// def <-> 7F