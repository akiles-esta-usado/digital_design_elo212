
module S4_Actividad3 #(parameter N=8)(
        input  logic [N-1:0] A, B,
        input  logic [1:0]   OpCode,
        output logic [N-1:0] Result,
        output logic [3:0]   Status //n,c,z,v
    );
    logic       Neg, Z, C, V;
    logic [N:0] internal_result;
    logic [N-1:0] neg_B;

    assign Result = internal_result[N-1:0];
    assign neg_B = ~B + 'd1;

    assign Status = {Neg, Z, C, V};

    // Operandos y Resultado    
    always_comb begin

        case(OpCode)
            2'b00:
                internal_result = A + B;

            2'b01: // Resta
                internal_result = A + neg_B;
                // internal_result = A - B;

            2'b10: // OR
                internal_result = A | B;

            2'b11: // AND
                internal_result = A & B;

            default: 
                internal_result = 'd0;

        endcase
    end

    // El resultado es negativo?
    assign Neg = Result[N-1];

    // El resultado es cero?
    always_comb begin
        if (Result == 'd0) begin
            Z = 'd1;
        end

        else begin
            Z = 'd0;
        end
    end

    // El resultado tuvo carry
    always_comb begin
        if (OpCode[1] == 1'b0 && internal_result[N]) begin
            C = 1'b1;
        end 
        else begin
            C = 1'b0;
        end
    end

    // El resultado tuvo overflow
    always_comb begin
        if (    
                (
                    ((A[N-1] ==  B[N-1]) && (OpCode == 2'b00))  ||
                    ((A[N-1] == ~B[N-1]) && (OpCode == 2'b01))  
                )
            &&
                (A[N-1] == ~Result[N-1])
                ) begin
            V = 'b1;
        end
        else begin
            V = 'b0;
        end
    end

endmodule