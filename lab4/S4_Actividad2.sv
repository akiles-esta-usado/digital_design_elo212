`timescale 1ns / 1ps

module S4_Actividad2 (
    input  logic  clock_100M,
    input  logic  reset,

    output logic clock_out_50M,
    output logic clock_out_30M,
    output logic clock_out_10M,
    output logic clock_out_1M
);

clock_divider #(
        .FREC_IN_MHZ(100), 
        .FREC_OUT_MHZ(50)) clock_divider_50 
        (
            clock_100M, 
            reset, 
            clock_out_50M
        );
        
clock_divider #(
        .FREC_IN_MHZ(100), 
        .FREC_OUT_MHZ(30)) clock_divider_30 
        (
            clock_100M, 
            reset, 
            clock_out_30M
        );
        
clock_divider #(
        .FREC_IN_MHZ(100), 
        .FREC_OUT_MHZ(10)) clock_divider_10 
        (
            clock_100M, 
            reset, 
            clock_out_10M
        );
        
clock_divider #(
        .FREC_IN_MHZ(100), 
        .FREC_OUT_MHZ( 1)) clock_divider_1  
        (
            clock_100M, 
            reset, 
            clock_out_1M
         );
         

endmodule