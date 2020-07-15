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

localparam WIDTH = 8;

typedef struct packed {
    logic [WIDTH-1:0] data_in;
    logic [0:3]       loads;
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
module tb_reg_ALU_display();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    in_s    in;
    out_s   out;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    reg_ALU_display #(.WIDTH(WIDTH)) dut(
        .clk        (clk),
        .reset      (reset),
        .data_in    (in.data_in),
        .load_A     (in.loads[0]),
        .load_B     (in.loads[1]),
        .load_Op    (in.loads[2]),
        .update_Res (in.loads[3]),
        .segments   (out.segments),
        .anodes     (out.anodes)
    );

    always #(period*0.5) clk = ~clk;

    initial begin
        clk   = 1;
        reset = 1;

        #(period*reset_duration);
        reset = 0;

    end

    // Aquí se juega
    initial begin
        #(period * reset_duration);

        // h11 + h11
        #(period);
        in.data_in = 'h11;
        in.loads[0] = 1;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h11;
        in.loads[0] = 0;
        in.loads[1] = 1;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h00;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 1;
        in.loads[3] = 0;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 1;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period * 8);

        // h22 + h22
        #(period);
        in.data_in = 'h22;
        in.loads[0] = 1;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h11;
        in.loads[0] = 0;
        in.loads[1] = 1;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h01;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 1;
        in.loads[3] = 0;

        #(period);
        in.data_in = 4'h00;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 1;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period * 8);
        
        $finish;
    end

    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
