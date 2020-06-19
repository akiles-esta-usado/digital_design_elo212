`timescale 1ns / 1ps

module free_run_counterNbit #(parameter N=8)(
    input logic i_clk, i_reset,
    input logic i_enable,
    input logic i_load,
    input logic [N-1:0] i_load_value,
    input logic i_dec,
    output logic [N-1:0] o_count);

    always_ff @(posedge i_clk)
        if(i_reset) begin
            o_count <= 0;
        end
        else if(!i_enable) begin
            o_count <= o_count; // No se si esto debería o no anotarse.
        end
        else if(i_load) begin
            o_count <= i_load_value; // overwrite counter with a custom value
        end
        else if (i_dec) begin
            o_count <= o_count - 1; //reverse counter
        end
        else begin
            o_count <= o_count + 1; //normal counter
        end
endmodule