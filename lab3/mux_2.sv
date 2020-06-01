`timescale 1ns / 1ps

module mux_2 #(parameter width=8)(

    input  logic             i_s,
    input  logic [width-1:0] i_d0, i_d1,
    output logic [width-1:0] o_y);

    assign o_y = i_s ? i_d1 : i_d0;
endmodule

