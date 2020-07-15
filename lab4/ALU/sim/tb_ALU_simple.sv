////////////////////////////////////////////////////////////////////////
// V0.1
// Este módulo debería simplificar el trabajo asociado a la verificación 
// exhaustiva de diseños HDL simples.
////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////
//  Las únicas cosas que hay que modificar son:
//  - estructuras de entrada y salida (in_s, out_s)
//  - Parámetros
//  - tipo del DUT y puertos.
///////////////////////////////////////////////////

interface ALU_iface #(parameter WIDTH=8);
    logic        [WIDTH-1:0] A, B;
    alu_opcode_t             OpCode;
    logic        [WIDTH-1:0] Result;
    logic        [3:0]       Status;

endinterface //ALU_iface


localparam period            = 10;     // duración de un periodo
localparam n_periods         = 40;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;    // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_ALU_simple();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    ALU_iface iface;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    ALU dut(
        .A      (iface.A),
        .B      (iface.B),
        .OpCode (iface.OpCode),
        .Result (iface.Result),
        .Status (iface.Status)
    );

    initial begin
        #(period * reset_duration);
        #(period * 0.3);


        $finish;
    end

    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

        #(period*n_periods);
        $finish;

    end
    
    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
