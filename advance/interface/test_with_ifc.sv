module test_with_ifc (arb_if.TEST arbif);

    initial begin
        @(posedge arbif.clk);
        
        arbif.request <= 2'b01;
        $display("@%0t: Drove req=01", $time);

        repeat (2) @(posedge arbif.clk);

        if (arbif.grant != 2'b01) begin
            $display("Error: grant != 2'b01", $time);
        end

        $finish;

    end
endmodule