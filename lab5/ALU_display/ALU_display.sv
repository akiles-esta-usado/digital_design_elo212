module ALU_display #(parameter WIDTH=8)(
        input  logic clk, reset,
        input  logic [WIDTH-1:0] A, B,
        input  logic [1:0]  OpCode,
        output logic [6:0]  Segments,
        output logic [7:0]  Anodes
    );

    logic [WIDTH-1:0] Result;
    logic [3:0]   Status; //n,c,z,v

    ALU #(.WIDTH(WIDTH)) ALU_inst(
        .A(A), 
        .B(B),
        .OpCode(OpCode),
        .Result(Result),
        .Status(Status)
        );

    hex_to_7seg #(.N(WIDTH)) to_7seg (
        .BCD_in  (Result),
        .clk     (clk), 
        .reset   (reset),
        .segments(Segments),
        .anodos  (Anodes)
    );

endmodule