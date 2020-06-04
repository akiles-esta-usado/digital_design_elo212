typedef enum logic [2:0] {ADD, SUB, OR, AND} opcode_t;

typedef struct packed {
    logic N, Z, C, V;
} status_t;

module S4_Actividad3 #(parameter N=8)(
        input  logic [N-1:0] A, B,
        input  opcode_t      OpCode,
        output logic [N-1:0] Result,
        output status_t      Status
    );

    always_comb begin
        if (OpCode == ADD) begin
            if (A[N-1] && B[N-1] == 1) begin
            end
        end
        else begin
            Status = Status;
        end
    end

    // Operandos y Resultado
    always_comb begin
        case(OpCode)
        2'b00:
            Result = A + B;

        2'b01: // Resta
            Result = A - B;

        2'b10: // OR
            Result = A | B;

        2'b11: // AND
            Result = A & B;

        default: Result = 'd0;
        endcase
    end
endmodule

