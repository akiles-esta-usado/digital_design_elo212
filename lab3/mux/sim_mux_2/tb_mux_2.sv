`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////
// Template desarrollado por: Akiles Viza
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

localparam N_IN  = 2;
localparam WIDTH = 4;

typedef struct packed {
    logic [N_IN-1:0] [WIDTH-1:0] d;
    logic             s;
} in_s;

typedef struct packed{
    logic [WIDTH-1:0] y;
} out_s;

localparam testvector_length = 100;    // Cantidad de vectores de prueba
localparam testvector_name   = "mux_2.mem"; // < nombre del archivo de vectores de prueba
localparam testvector_bits   = 13;       // < cantidad de bits de vector de prueba
localparam out_bits          = WIDTH;       // < cantidad de bits de salida del DUT
localparam period            = 15;     // duración de un periodo
localparam n_periods         = 20;     // Cantidad de ciclos a realizar
localparam reset_duration    = 3.2;       // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////

module tb_mux_2();
    logic   clk, reset;

    in_s    in;
    out_s   out;
    out_s   expected_late;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    mux #(.N_IN(N_IN), .WIDTH(WIDTH)) dut(
        .i_d (in.d),
        .i_s (in.s),
        .o_y (out.y)
    );

    //////////////////////////////////////////////////////////////////////
    // De aquí para abajo no se necesita modificar nada.
    // EXCEPTO si el DUT no ocupa entrada o salida. En tal caso tienes que 
    // editar el módulo reader para que solo lea en la que use.
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //////////////////////////////////////////////////////////////////////

    reader reader_inst(
        .i_clk      (clk),
        .i_reset    (reset),
        .o_in       (in),
        .o_expected (expected_late)
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

    /////////////////////////////////
    // Definición de Módulos internos
    /////////////////////////////////

    module reader(
            input  logic i_clk, i_reset,
            output in_s  o_in,
            output out_s o_expected
        );

        ///////////////////////////////////////////////////////////////
        // Lee los datos del archivo de memoria para entregarlos al DUT
        ///////////////////////////////////////////////////////////////

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

endmodule