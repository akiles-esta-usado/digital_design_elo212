`timescale 1ns / 1ps

localparam N = 10;

typedef struct packed {
    logic [N-1:0] BCD_in;
} in_s;

typedef struct packed{
    logic [6:0] segments;
    logic [7:0] anodos;
} out_s;


localparam period            = 10;     // duración de un periodo
localparam n_periods         = 10;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // cantidad de periodos antes de apagar el reset.

module tb_hex_to_7seg_simple();

    logic   clk, reset;

    in_s    in;
    out_s   out;

    hex_to_7seg #(N) dut(
        .clock      (clk),
        .reset      (reset),
        .BCD_in     (in.BCD_in),
        .segments   (out.segments),
        .anodos     (out.anodos)
    );

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

        #(period*n_periods);
        $finish;

    end

endmodule
