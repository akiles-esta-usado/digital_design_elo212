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

/*
   0     1             NZCV
   1     1             NZCV
   7     1             NZCV
  -8    -1             NZCV
  -1     1             NZCV
   4    -4             NZCV
*/


typedef struct packed {
    logic [3:0] A;
    logic [3:0] B;
    logic [1:0] opcode;
} in_s;

typedef struct packed{
    logic [3:0] result;
    logic [3:0] status;
} out_s;

localparam testvector_length = 100;    // Cantidad de vectores de prueba
localparam testvector_name   = "top_3_4.mem"; // < nombre del archivo de vectores de prueba
localparam testvector_bits   = 18;       // < cantidad de bits de vector de prueba
localparam out_bits          = 8;       // < cantidad de bits de salida del DUT
localparam period            = 10;     // duración de un periodo
localparam n_periods         = 40;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_top_3();
    timeunit      1ns;
    timeprecision 1ps;
    logic   clk, reset;

    in_s    in;
    out_s   out;
    out_s   expected;

    // logic [4:0] just_testing;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    S4_Actividad3 #(4) dut(
        .A      (in.A),
        .B      (in.B),
        .OpCode (in.opcode),
        .Result (out.result),
        .Status (out.status)
        // ,.just_testing(just_testing)
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
        .o_expected(expected)
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

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
