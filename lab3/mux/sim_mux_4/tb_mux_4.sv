`timescale 1ns / 1ps

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

typedef struct packed {
    logic [3:0] d0;
    logic [3:0] d1;
    logic [3:0] d2;
    logic [3:0] d3;
    logic [1:0] s;
} in_s;

typedef struct packed{
    logic [3:0] y;
} out_s;


localparam testvector_length = 100;    // Cantidad de vectores de prueba
localparam testvector_name   = "mux_4.mem"; // < nombre del archivo de vectores de prueba
localparam testvector_bits   = 22;       // < cantidad de bits de vector de prueba
localparam out_bits          = 4;       // < cantidad de bits de salida del DUT
localparam period            = 10;     // duración de un periodo
localparam n_periods         = 40;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_mux_4();

    logic   clk, reset;

    in_s    in;
    out_s   out;
    out_s   expected_late;
    out_s   expected_early;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    mux_4 #(4) dut(
        .i_d0(in.d0),
        .i_d1(in.d1),
        .i_d2(in.d2),
        .i_d3(in.d3),
        .i_s (in.s) ,
        .o_y (out.y)
    );

    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // EXCEPTO si el DUT no ocupa entrada o salida. En tal caso tienes que 
    // editar el módulo reader para que solo lea en la que use.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    reader reader_inst(
        .i_clk(clk),
        .i_reset(reset),
        .o_in(in),
        .o_expected(expected_late)
    );

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

        #(period*n_periods);
        $finish;

    end

    ///////////////////////////////////////////////////////////////////////
    //////////////////   Definición de Módulos internos   /////////////////
    ///////////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////
    // reader
    //
    // Lee los datos del archivo de memoria para entregarlos al DUT
    ///////////////////////////////////////////////////////////////

    module reader(
            input  logic i_clk, i_reset,
            output in_s  o_in,
            output out_s o_expected
        );

        logic [31:0]                vectornum;
        logic [testvector_bits-1:0] testvector [testvector_length-1:0];

        always_ff @(posedge i_clk) begin
            if (i_reset) begin
                $readmemb(testvector_name, testvector);
                vectornum <= 0;
            end
            else begin

                ///////////////////////////////////////////////////////////
                // Aquí modifica si el DUT no ocupa alguna entrada o salida
                ///////////////////////////////////////////////////////////
                {o_in, o_expected} <= testvector[vectornum];

                vectornum <= vectornum + 1;
            end
        end
    endmodule

    ///////////////////////////////////////////////////////////////////
    // just_delay
    //
    // Debido al retraso que puede generar el DUT cuando es secuencial,
    // es necesario retrasar también la salida esperada
    ///////////////////////////////////////////////////////////////////
    
    module just_delay(
            input  logic i_clk, i_reset,
            input  out_s  i_expected,
            output out_s  o_expected
        );

        always_ff @(posedge i_clk) begin
            o_expected <= i_expected;
        end


    endmodule

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
