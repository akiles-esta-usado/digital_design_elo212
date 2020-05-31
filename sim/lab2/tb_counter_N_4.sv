`timescale 1ns / 1ps

module tb_counter_N_4();
    /*
        Cosas que tienes que corregir
        - El tipo del DUT
        - El largo del vector de tests
        - La cantidad de bits de cada test (IN + OUT)
        - Si la salida es un vector, corrige el tipo de dato de 'expected'.
        - En el canto de subida, el ajuste de las entradas
        - El periodo del reloj, recuerda que para el canto de bajada la salida ya debe estar estable
        -
    */

    parameter testvector_length = 500;
    parameter testvector_name = "counter_4.mem";
    parameter testvector_bits = 4;

    // Variables del simulador
    logic                       clk, reset;
    logic [3:0]                 expected;   // Valor de salida esperado
    logic [31:0]                vectornum, errors; // Iteradores de 32 bits
    logic [testvector_bits-1:0] testvector [testvector_length-1:0];
                                    // El arreglo que contendrá los vectores

    // Variables del DUT - Design under Test
    logic [3:0]  y;

    counter_N #(4) DUT(clk, reset, y);

    // Reloj, ajusta el periodo
    always begin
        clk = ~clk;
        #5;
    end

    // Obtención de datos, revisa instrucciones.md para ver como agregar el archivo al workspace
    initial begin
        $readmemb(testvector_name, testvector);
        vectornum = 0;
        errors = 0;
        reset = 1;  // Detiene la lógica de verificación, los resultados no van a cambiar con clk.
        clk = 0;

        #14; // Esto es poco después del canto de bajada.
        reset = 0;

    end

    // Canto Subida -> Actualizar entrada
    // Recuerda ajustar las señales de entrada y salida.
    always @(posedge clk) begin
        #1;
        {expected} = testvector[vectornum];
    end

    // Canto Bajada -> Revisar salida
    // Esto debería ser editado para ajustarse a los otros módulos
    always @(negedge clk) begin
        if (~reset) begin
            $display("%t: y = %d, expected = %d", $realtime, y, expected);

            if (y !== expected) begin
                $error("Error: y = %d y no %d", y, expected);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;

            if (testvector[vectornum] === {testvector_bits{1'bx}}) begin
                $display("La verificación culmina con");
                $display("%d tests y",vectornum);
                $display("%d errores", errors);
                $finish;
            end
        end
    end
endmodule
