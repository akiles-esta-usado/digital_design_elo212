
module S4_Actividad3 #(parameter N=8)(
        input  logic [N-1:0] A, B,
        input  logic [1:0]   OpCode,
        output logic [N-1:0] Result,
        output logic [3:0]   Status //n,c,z,v
        // output logic [N:0] just_testing
    );
    logic       Neg, Z, C, V;
    logic [N:0] internal_result;
    logic       neg_B;

    assign Result = internal_result[N-1:0];
    // assign just_testing = internal_result; // Borrar
    // assign neg_B = ~B + 'd1;

    assign Status = {Neg, Z, C, V};

    // Operandos y Resultado
    always_comb begin

        case(OpCode)
            2'b00:
                internal_result = A + B;

            2'b01: // Resta
                // internal_result = A + neg_B;
                internal_result = A - B;

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


    always_comb begin
        if ((((A[N-1] & B[N-1]) && (OpCode == 2'b00))||
             (A[N-1] ^ B[N-1] && OpCode == 2'b01)   ) &&
            (A[N-1] ^ Result[N-1])) begin
            V = 'b1;
        end
        else begin
            V = 'b0;
        end
    end

endmodule


/*
module S4_Actividad3 #(parameter N=8)(
        input  logic [N-1:0] A, B,
        input  logic [1:0]   OpCode,
        output logic [N-1:0] Result,
        output logic [3:0]   Status //n,c,z,v
    );
    logic   Neg, Z, C, V;
    logic [32:0] Sum; //variable que guardara la suma
    assign Status = {Neg, Z, C, V};
    assign condinvb = OpCode[0] ? ~B : B; 
    assign Sum = A + condinvb + OpCode[0];

    // Operandos y Resultado
    always_comb begin
        case(OpCode[1:0])
        2'b00:
            Result = Sum;

        2'b01: // Resta
            Result = A - B;

        2'b10: // OR
            Result = A | B;

        2'b11: // AND
            Result = A & B;

        default: Result = 'd0;
        endcase
    
    assign Neg = Result[31]; //negativo
    assign Z= (Result == 32'b0); //zero
    assign C= (OpCode[1] == 1'b0) & Sum[32];// and del negado de OpCode y el resultado de la suma
    assign V= (OpCode[1] == 1'b0) & ~(A[31] ^ B[31] ^ OpCode[0]) & (A[31] ^ Sum[31]);
    end

endmodule
*/