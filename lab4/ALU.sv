typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
typedef enum logic [3:0] {N, Z, C, V} status_t;

module ALU #(parameter N = 8)(
        input  logic [N-1] A, B,
        input  opcode_t    OpCode,
        output logic [N-1] Result,
        output status_t    Status 
        );

    



endmodule;
