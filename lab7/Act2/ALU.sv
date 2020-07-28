module ALU
    #(parameter WIDTH=8)(
        input  logic [WIDTH-1:0] A,
        input  logic [WIDTH-1:0] B,
        input  logic [1:0]       OpCode,
        output logic [WIDTH-1:0] Result,
        output logic [3:0]       Status //n,z,c,v
    );
    
    logic N, Z, C, V;

    logic [WIDTH-1:0] B_neg;

    localparam ADD      = 2'd0;
    localparam SUBTRACT = 2'd1;
    localparam OR       = 2'd2;
    localparam AND      = 2'd3;

    always_comb begin
        Z = 1'b0;
        C = 1'b0;
        V = 1'b0;

        case(OpCode)
            ADD: begin
                {C, Result} = A + B;
                V = (Result[WIDTH-1] & ~A[WIDTH-1] & ~B[WIDTH-1]) | (~Result[WIDTH-1] & A[WIDTH-1] & B[WIDTH-1]);
            end
                
            SUBTRACT: begin
                B_neg = -B;
                {C, Result} = A + B_neg;
                V = (Result[WIDTH-1] & ~A[WIDTH-1] & B[WIDTH-1]) | (~Result[WIDTH-1] & A[WIDTH-1] & ~B[WIDTH-1]);
            end

            OR: begin
                Result = A | B;
                C = 1'b0;
            end

            AND: begin
                Result = A & B;
                C = 1'b0;
            end

            default: 
                Result = 'd0;

        endcase

        if (Result == {WIDTH{1'd0}}) Z = 1'b1;

    end

    assign N = Result[WIDTH-1];

    // logic [3:0]   Status //n,z,c,v
    assign Status = {N, Z, C, V};
                //   3  2  1  0
endmodule
