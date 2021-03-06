`timescale 1ns / 1ps

module decoder #(N=3) (
        input  logic [N-1   :0] i_a,
        output logic [2**N-1:0] o_y);

    always_comb begin
        o_y      = 0;  // todas las salidas tendrán este valor
        o_y[i_a] = 1;  // menos la que sea indicada por la entrada.
    end

endmodule
