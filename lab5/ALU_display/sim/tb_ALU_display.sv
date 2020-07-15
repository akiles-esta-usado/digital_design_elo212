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

localparam WIDTH = 32;

typedef struct packed {
    logic [WIDTH-1:0] A, B;
    logic [1:0]       OpCode;
} in_s;

typedef struct packed{
    logic [6:0] segments;
    logic [7:0] anodes;
} out_s;

localparam period            = 10;     // duración de un periodo
localparam n_periods         = 10;     // Cantidad de ciclos a realizar luego del reset
localparam reset_duration    = 2.2;    // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_ALU_display();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    in_s    in;
    out_s   out;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    ALU_display #(.WIDTH(WIDTH)) dut(
        .clk      (clk),
        .reset    (reset),
        .A        (in.A),
        .B        (in.B),
        .OpCode   (in.OpCode),
        .Segments (out.segments),
        .Anodes   (out.anodes)
    );

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 1;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

    end

    // Aquí se juega
    // 0 -> 01
    initial begin
        #(period * reset_duration);

        #(period);
        in.A = 'h11;
        in.B = 'h11;
        in.OpCode = 'b00;
        // 0x11 + 0x11 = 0x22 -> {01,01,01,01,01,01,12,12}
        #(period * 8);

        #(period);
        in.A = 'h00;
        // 0x11 + 0x00 = 0x11 -> {01,01,01,01,01,01,4F,4F}
        #(period * 8);


        #(period);
        in.A = 'h22;
        in.OpCode = 'b01;
        // 0x22 - 0x11 = 0x11 -> {01,01,01,01,01,01,4F,4F}
        #(period * 8);


        #(period);
        in.B = 'h33;
        in.OpCode = 'b01;
        // 0x22 - 0x33 =-0x11 -> {38,38,38,38,38,38,30,38},(0x11 es b00010001)
        #(period * 8);


        #(period * 8);
        $finish;
    end

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
