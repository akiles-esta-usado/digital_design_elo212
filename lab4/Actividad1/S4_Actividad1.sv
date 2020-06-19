`timescale 1ns / 1ps

// Este módulo subdivide los bits de entrada en bloques de 4 bits.
// estos bloques, por medio de TDM, se entregan a cada display.

// Se asume que el orden de los digitos es acorde al de los ánodos, es decir
// AN0 se encarga del ánodo del dígito menos significativo.

// La Nexys A7 tiene un display de 8 dígitos (que en realidad son 2 de 4), 
// eso significa que no podemos mostrar números con más de 32 bits (8*4)
// este módulo es incapaz de mostrar dígitos mayores a 32 bits.

// Se van a encender los 8 dígitos del display, el resto de bits no usados
// se consideran ceros, y los bloques que no tengan bits de entrada mostrarán 
// un 0 en el display

// Una mejora puede ser añadir un contador que cuente solamente hasta el 
// último bloque ocupado,de esta manera se evitaría iterar por las entradas
// que no tienen valor y no se mostrarían bloques que no tengan bits.

module S4_Actividad1 
    #(parameter N = 32)
    (
        input  logic [N-1:0] BCD_in,
        input  logic         clock, reset,
        output logic [6:0]   segments,
        output logic [7:0]   anodos
    );

    localparam N_BLOCKS = $ceil( real'(N) * 0.25);

    logic [3:0] current_BCD_block;  // Subgrupo de 4 bits que serán convertidos
    logic [2:0] select;             // cantidad que indica qué bloque de bits mostrar

    logic [31:0] mux_in;    // Esto representa todas las entradas del mux, solamente ocuparemos N de estas

    always_comb begin
        mux_in = 32'h00000_00000;
        mux_in[N-1:0] = BCD_in;
    end


    mux_8 #(.width(4)) mux_BCD_in (
        .i_d0( mux_in[3:0]   ),
        .i_d1( mux_in[7:4]   ),
        .i_d2( mux_in[11:8]  ),
        .i_d3( mux_in[15:12] ),
        .i_d4( mux_in[19:16] ),
        .i_d5( mux_in[23:20] ),
        .i_d6( mux_in[27:24] ),
        .i_d7( mux_in[31:28] ),
        .i_s ( select        ),
        .o_y ( current_BCD_block)
    );

    counter_N #(.N(3)) counter_block (
        .clk  (clock),
        .reset(reset),
        .count(select)
    );

    BCD_to_seven_seg BCD_convertor(
        .i_BCD(current_BCD_block),
        .o_seven_seg(segments)
        );
    
    decoder_one_cold #(3) decoder_inst (
        .i_a (select),
        .o_y (anodos)
    );

endmodule