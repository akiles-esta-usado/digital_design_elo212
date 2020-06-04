`timescale 1ns / 1ps

module mux_4 #(parameter width=8)(
        input  logic [width-1:0] i_d0, i_d1, i_d2, i_d3,
        input  logic [1:0]       i_s,
        output logic [width-1:0] o_y);

    logic [width-1:0] low, hi;

    mux_2 #(width) lowmux(i_d0,  i_d1, i_s[0], low);
    mux_2 #(width) himux (i_d2,  i_d3, i_s[0], hi );
    mux_2 #(width) outmux(low,   hi,   i_s[1], o_y  );

endmodule
