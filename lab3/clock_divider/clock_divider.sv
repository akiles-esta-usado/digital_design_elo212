
module clock_divider #(parameter N=2) (
        input  logic i_clk, i_reset,
        output logic o_clk_out
    );
    
    logic [N-1:0] counter;

    assign o_clk_out = counter[N-1];

    always_ff @(posedge i_clk) begin
        
        if (i_reset) begin
            counter <= 'b0;
        end

        else begin 
            counter <= counter+1;
        end
    end
endmodule

/*
Importante notar que cuando sacamos el reset en la simulacipón, el valor 
que toma el contador al canto de reloj será 1 y los testvectors deben 
adecuarse a ello.

*/