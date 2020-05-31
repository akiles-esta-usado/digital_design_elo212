`timescale 1ns / 1ps

module decoder #(N=3) (
        input  logic [N-1:0]    a,
        output logic [2**N-1:0] y);

    always_comb begin
        y    = 0;  // todas las salidas tendrán este valor
        y[a] = 1;  // menos la que sea indicada en la entrada.
    end

endmodule
