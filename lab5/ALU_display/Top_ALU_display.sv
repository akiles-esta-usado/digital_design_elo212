module top_ALU_display(
        input logic CLK100MHZ,
        input logic CPU_RESETN,
        input  logic [9:0] SW,
        output logic [7:0] AN,
        output logic CA, CB, CC, CD, CE, CF, CG
    );
    
    logic reset;
    
    assign reset = ~CPU_RESETN;

    ALU_display #(.WIDTH(4)) system(
        .clk      (CLK100MHZ                    ),
        .reset    (reset                        ),
        .A        (SW[9:6]                      ),
        .B        (SW[5:2]                      ),
        .OpCode   (SW[1:0]                      ),
        .Segments ({CG, CF, CE, CD, CC, CB, CA} ),
        .Anodes   (AN                           )
    );

endmodule