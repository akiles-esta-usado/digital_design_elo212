`timescale 1ns / 1ps

module tb_fib_circuit();
    // Entradas
    logic       clk, reset;
    
    // Salidas
    logic       fib, display_on;
    logic [7:0] sevenSeg;

    // DUT
    fib_circuit DUT(
        .i_clk(clk),
        .i_reset(reset),
        .o_fib(fib),
        .o_display_on(display_on),
        .o_sevenSeg(sevenSeg)
        );

    // Reloj
    always begin
        #10;
        clk = ~clk;
    end
    
    // Testbench
    initial begin
        clk = 0;
        reset = 0;
        
        #11;
        reset = 1;
        
        
    end

endmodule
