`timescale 1ns / 1ps

import testbench_basics::*;

module test_procedural_2 ();
    
    string filename = "fib_circuit.mem";

    int fd, c;

    string testvector;

    logic [7:0] digits;
    logic       last_digit;

    initial begin
        $display(filename);

        read_file(filename);
    
        $finish;

    end
endmodule

module test_procedural_1 ();

    bit [127:0] cmd;
    int file, c;

    logic [7:0] digits;
    logic       last_digit;

    initial begin
        $display("Test");


        file = $fopen("fib_circuit.mem", "r");

        while(!$feof(file)) begin
            c = $fscanf(file, "%s", cmd);

            {digits, last_digit} = cmd;

            $display("content: %s - digits: %b, last: %b", cmd, digits, last_digit);
        end

        #10;
        $finish;
    end

endmodule
