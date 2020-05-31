`timescale 1ns / 1ps

module tb_decoder();
    logic clk, reset;
    logic [2:0] x;
    logic [7:0] y;


    decoder DUT(x, y);

    always begin
        #5
        clk = ~clk;
    end

    initial begin
        reset = 0;
        clk = 0;
        #3
        x = 3'd0;

        #10;
        x = 3'd1;

        #10;
        x = 3'd2;

        #10;
        x = 3'd3;

        #10;
        x = 3'd4;

        #10;
        x = 3'd5;

        #10;
        x = 3'd6;

        #10;
        x = 3'd7;

        #10;
        x = 3'd8;

        #10;
        x = 3'd9;

        #10;
        x = 3'd10;

        #10;
        $finish;
    end
endmodule
