`timescale 1ns / 1ps

/////// Tabla de equivalencia de MHz a ns ///////
// 100 MHz ->   10   ns
//  50 MHz ->   20   ns
//  30 MHz ->   33.3 ns (aproximado a 30 o a 40)
//  10 Mhz ->  100   ns
//   1 MHz -> 1000   ns
/////// Tabla de equivalencia de MHz a ns ///////

module clock_divider
    #(
        parameter FREC_IN_MHZ = 100,
        parameter FREC_OUT_MHZ = 50
    )(
        input  logic  i_clk,
        input  logic  i_reset,
        output logic  o_clk
    );

    localparam COUNT_MAX = int'(0.5 * real'(FREC_IN_MHZ) / FREC_OUT_MHZ);

    clock_divider_simple #(COUNT_MAX) clock_divider_instance (
            .i_clk(i_clk),
            .i_reset(i_reset),
            .o_clk(o_clk)
        );

endmodule