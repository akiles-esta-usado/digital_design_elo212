module tasks();
    timeunit      1ns;
    timeprecision 1ps;

    logic clk, reset;

    logic [31:0] counter;

    task automatic wait_10(ref counter);
        #10;
        counter++;
        #10;
    endtask

    initial begin
        counter = 'd0;



        wait_10(counter);


        wait_10(counter);

        $finish;

    end


endmodule