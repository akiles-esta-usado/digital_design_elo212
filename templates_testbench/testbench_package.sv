package testbench_basics;

    function automatic void read_file( 
            input string filename
            );

        int fd;

        string testvector;

        logic [7:0] digits;
        logic       last_digit;

        $display("Hola");


        fd = $fopen(filename, "r");

        if(fd == 0) begin
            $display("ERROR: El archivo %s no se pudo abrir", filename);
            $finish;
        end

        

        while( !$feof(fd) ) begin

            $fgets(testvector, fd);

            {digits, last_digit} = testvector.atobin();

            $display("content: %s", testvector);
            $display("digits: %b, last: %b", digits, last_digit);
            $display("");
        end

    endfunction

endpackage: testbench_basics