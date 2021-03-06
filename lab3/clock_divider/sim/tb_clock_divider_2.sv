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
    logic       none;
} in_s;

typedef struct packed{
    logic   clk_out;
} out_s;

parameter testvector_length = 100;    // Cantidad de vectores de prueba
parameter testvector_name   = "clock_divider_2.mem"; // < nombre del archivo de vectores de prueba
parameter testvector_bits   = 1;       // < cantidad de bits de vector de prueba
parameter out_bits          = 1;       // < cantidad de bits de salida del DUT
parameter period            = 10;     // duración de un periodo
parameter n_periods         = 40;     // Cantidad de ciclos a realizar
parameter reset_duration    = 3.2;       // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_clock_divider_2();
    logic   clk, reset;

    in_s    in;
    out_s   out;
    out_s   expected_late;
    out_s   expected_early;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    clock_divider dut(
        .i_clk        (clk),
        .i_reset      (reset),
        .o_clk_out    (out.clk_out)
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
    //////////////////////////////////////////////////////////////////
    // Este bloque genera un retraso en un ciclo entre expected_late y 
    // expected_early
    //////////////////////////////////////////////////////////////////
    just_delay delay(

        .i_clk      (clk),
        .i_reset    (reset),
        .i_expected (expected_late),
        .o_expected (expected_early)
    );

    ///////////////////////////////////////////////////////////////////////
    // Si se llegara a ocupar el módulo verifier, revisar bien si debe usar 
    // expected_late o expected_early. Tienen un ciclo de diferencia
    ///////////////////////////////////////////////////////////////////////
    /* 
    verifier verifier_inst(
        .i_clk(clk),
        .i_reset(reset),
        .i_out(out),
        .i_expected(expected) // ¿Late o Early?
    );

    */

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
                {o_expected} <= testvector[vectornum];

                vectornum <= vectornum + 1;
            end
        end
    endmodule

    
    module just_delay(
            input  logic i_clk, i_reset,
            input  out_s  i_expected,
            output out_s  o_expected
        );

        ///////////////////////////////////////////////////////////////////
        // Debido al retraso que puede generar el DUT cuando es secuencial,
        // es necesario retrasar también la salida esperada
        ///////////////////////////////////////////////////////////////////

        always_ff @(posedge i_clk) begin
            o_expected <= i_expected;
        end


    endmodule

    /*  
    module verifier(
            input logic i_clk, i_reset,
            input out_s i_out,
            input out_s i_expected
        );

        ///////////////////////////////////////////////////////////////////
        // Este módulo verifica que la salida dada por el DUT sea la misma
        // que se indica en el archivo de memoria.
        //
        // No es tan importante para módulos 'simples'.
        ///////////////////////////////////////////////////////////////////

        logic [31:0] errors;

        always_ff @(negedge i_clk) begin
            if (~i_reset) begin
                if (i_expected === {out_bits{1'bx}}) begin
                    $display("Prueba finalizada con %d errores", errors);
                    $finish;
                end

                $display("%t: out = {%b}; expected = {%b}", $realtime, i_out, i_expected);

                if(i_out !== i_expected) begin
                    $display("ERROR");
                    errors <= errors + 1;
                end
            end
            else begin
                errors <= 0;
            end
        end

    endmodule
    */

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
