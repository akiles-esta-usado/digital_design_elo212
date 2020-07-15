module tb_hex_to_7seg_supersimple();
    timeunit      1ns;
    timeprecision 1ps;

    localparam N = 10;

    logic   clk, reset;

    logic [6:0] segments;
    logic [N-1:0] BCD_in;
    logic [7:0] anodos;
    
    hex_to_7seg #(N) dut(
        .clock      (clk),
        .reset      (reset),
        .BCD_in     (in.BCD_in),
        .segments   (out.segments),
        .anodos     (out.anodos)
    );

    initial begin
        #(10);
        $finish;
    end

endmodule
