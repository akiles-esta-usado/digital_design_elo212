localparam N = 31;

localparam period            = 10;     // duración de un periodo
localparam test_duration     = 400 * period;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2 * period;       // cantidad de periodos antes de apagar el reset.

module tb_hex_to_7seg_simple();
    timeunit 1ns;
    timeprecision 1ps;

    logic   clk, reset;

    struct packed {
        logic [N-1:0] BCD_in;
    } in;

    struct packed{
        logic [6:0] segments;
        logic [7:0] anodos;
    } out;


    hex_to_7seg #(N) dut(
        .clk      (clk),
        .reset      (reset),
        .BCD_in     (in.BCD_in),
        .segments   (out.segments),
        .anodos     (out.anodos)
    );

    initial begin
        #(reset_duration); // Se comienza cuando el reset termina

        in.BCD_in = 'd10;    // a -> 08
        #(8*period);

        in.BCD_in = 'd255;   // FF -> 0E
        #(8*period);

        in.BCD_in = 'd65535; // FFFFFFFF ->
        #(8*period);


        $finish;
    end

    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////


    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(reset_duration);
        reset = 0;

        #(test_duration);
        $finish;

    end

endmodule
