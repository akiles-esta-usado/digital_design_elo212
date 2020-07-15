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

localparam WIDTH = 4;

typedef struct packed {
    logic [WIDTH-1:0] A, B;
    logic [1:0]       OpCode;
    logic [0:3]       loads;
} in_s;

typedef struct packed{
    logic [WIDTH-1:0] Result;
} out_s;

localparam period            = 10;     // duración de un periodo
localparam n_periods         = 10;     // Cantidad de ciclos a realizar luego del reset
localparam reset_duration    = 2.2;    // Razón respecto al periodo

///////////////////////////////////
// Modifica el nombre del testbench
///////////////////////////////////
module tb_reg_ALU();
    timeunit      1ns;
    timeprecision 1ps;

    logic   clk, reset;

    in_s    in;
    out_s   out;

    //////////////////////////////////////////
    // Modifica las entradas y el tipo del DUT
    //////////////////////////////////////////
    reg_ALU #(.WIDTH(WIDTH)) dut(
        .i_clk        (clk),
        .i_reset      (reset),
        .i_A          (in.A), 
        .i_B          (in.B),
        .i_OpCode     (in.OpCode),
        .i_load_A     (in.loads[0]), 
        .i_load_B     (in.loads[1]), 
        .i_load_Op    (in.loads[2]), 
        .i_update_Res (in.loads[3]),
        .o_Result     (out.Result)

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

        #(period);
        in.A      = 'd2;
        in.B      = 'd4;
        in.OpCode = 'd0;

        for(int i = 0; i < 4; i++) begin
            #(period);
            in.loads = 4'd0;
            in.loads[i] = 1'b1;
        end

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        // 2da tanda
        #(period);
        in.A      = 'd2;
        in.B      = 'd1;
        in.OpCode = 'd1;

        for(int i = 0; i < 4; i++) begin
            #(period);
            in.loads = 4'd0;
            in.loads[i] = 1'b1;
        end

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;


        #(period*5);
        $finish;
    end

    
    /////////////////////////////////////////
    // Template desarrollado por: Akiles Viza
    /////////////////////////////////////////
endmodule
