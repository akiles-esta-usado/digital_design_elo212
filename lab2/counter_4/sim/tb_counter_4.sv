`timescale 1ns / 1ps


/*
 *  Las únicas cosas que hay que modificar son:
 *  - estructuras de entrada y salida
 *  - Parámetros.
 */
typedef struct packed {
    logic       none;
} in_s;

typedef struct packed{
    logic [3:0] count;
} out_s;

parameter testvector_length = 100;               // Cantidad de vectores de prueba
parameter testvector_name   = "counter_4.mem"; // nombre del archivo que contiene los vectores de prueba
parameter testvector_bits   = 4;                // cantidad de bits del vector de prueba
parameter out_bits          = 4;                 // cantidad de bits de salida
parameter period            = 10;                // duración de un periodo
parameter n_periods         = 40;                // Cantidad de ciclos a realizar

module tb_counter_4();
    logic   clk, reset;

    in_s    in;
    out_s   out;
    out_s   expected_late;
    out_s   expected_early;

    counter_4 dut(
        .i_clk        (clk),
        .i_reset      (reset),
        .o_count     (out.count)
    );

    reader reader_inst(
        .i_clk(clk),
        .i_reset(reset),
        .o_in(in),
        .o_expected(expected_late)
    );

    just_delay delay(

        .i_clk      (clk),
        .i_reset    (reset),
        .i_expected (expected_late),
        .o_expected (expected_early)
    );

    /*
    verifier verifier_inst(
        .i_clk(clk),
        .i_reset(reset),
        .i_out(out),
        .i_expected(expected)
    );
    
    */

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;

        #(period*1.3);
        reset = 0;

        #(period*n_periods);
        $finish;

    end





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
            {o_in, o_expected} <= testvector[vectornum]; 
            
            vectornum <= vectornum + 1;
        end
    end
endmodule

// Debido al retraso dado por el DUT secuencial, es necesario retrasar también la salida esperada
module just_delay(
        input  logic i_clk, i_reset,
        input  out_s  i_expected,
        output out_s  o_expected
    );

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
endmodule
