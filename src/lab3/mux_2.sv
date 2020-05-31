`timescale 1ns / 1ps

module mux_2 #(parameter width=8)(

    input  logic             s,
    input  logic [width-1:0] d0, d1,
    output logic [width-1:0] y);

    assign y = s ? d1 : d0;
endmodule

