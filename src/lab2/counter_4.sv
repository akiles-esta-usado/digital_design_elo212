`timescale 1ns / 1ps

module counter_4(
    input  logic        clk, reset,
    output logic [3:0]  count
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 4'b0;
        end
        else begin
            count <= count+1;
        end
    end
endmodule
