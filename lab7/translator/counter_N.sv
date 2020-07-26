`timescale 1ns / 1ps

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