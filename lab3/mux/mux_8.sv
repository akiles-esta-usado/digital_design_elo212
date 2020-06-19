`timescale 1ns / 1ps

module mux_8 #(parameter width=8)(
        input  logic [width-1:0] i_d0, i_d1, i_d2, i_d3, i_d4, i_d5, i_d6, i_d7,
        input  logic [2:0]       i_s,
        output logic [width-1:0] o_y);

    logic [width-1:0] low, hi;

    mux_4 #(width) lowmux(i_d0,  i_d1, i_d2, i_d3, i_s[1:0], low);
    mux_4 #(width) himux (i_d4,  i_d5, i_d6, i_d7, i_s[1:0], hi );
    mux_2 #(width) outmux(low, hi, i_s[2]  , o_y);

endmodule
