`timescale 1ns / 1ps

// Asumiendo clk_freq_in period = 10 [ns] (100 MHz) (#1 en timescale 1ns/1ps)

/////// Tabla de equivalencia de MHz a ns ///////
// 100 MHz ->   10   ns
//  50 MHz ->   20   ns
//  30 MHz ->   33.3 ns (aproximado a 30 o a 40)
//  10 Mhz ->  100   ns
//   1 MHz -> 1000   ns
/////// Tabla de equivalencia de MHz a ns ///////

// TODO: TESTBENCH !!!

module clk_divider 
    #(parameter clk_out = 50) 
    (
        input  logic  i_clk,
        input  logic  i_reset,
        output logic  o_clk
    );

    localparam DELAY_WIDTH = $clog2((1/clk_out)*100); 
    logic [DELAY_WIDTH-1:0] counter = 'd0;

    always_ff @(posedge i_clk) begin
        
        if (i_reset == 1'b1) begin
            counter <= 'd0;
            o_clk   <= 1'b0;
        end

        else if (counter*20 == ((1/clk_out)*1000) ) begin
            o_clk <= ~o_clk;
        end

        else if (counter*10 == ((1/clk_out)*1000) ) begin
            o_clk <= ~o_clk;
            counter <= 'd0;
        end

        else begin
            counter <= counter + 'd1;
            o_clk <= o_clk;
        end

    end
endmodule