
module S4_Actividad3 #(parameter N=8)(
        input  logic [N-1:0] A, B,
        input  logic [1:0]  OpCode,
        output logic [N-1:0] Result,
        output status_t  [3:0]    Status //n,c,z,v
    );
    logic   Neg, Z, C, V;
    logic [32:0] Sum; //variable que guardara la suma
    assign condinvb = OpCode[0] ? ~b : b;
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
    assign V= (OpCode_t[1] == 1'b0) & ~(A[31] ^ B[31] ^ ALUControl[0]) & (A[31] ^ Sum[31]);
    end

endmodule