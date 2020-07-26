module mux #(  parameter N_IN = 6, WIDTH  = 8) 
    (
        input  logic [N_IN-1:0] [WIDTH-1:0]        i_d,
        input  logic            [$clog2(N_IN)-1:0] i_s,
        output logic            [WIDTH-1:0]        o_y
    );

    always_comb begin
        o_y = 'd0;
        o_y = i_d[i_s];
    end

endmodule