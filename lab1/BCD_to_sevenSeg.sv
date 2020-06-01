`timescale 1ns / 1ps

module BCD_to_sevenSeg(
    input  logic [3:0] BCD_in,
    output logic [7:0] sevenSeg
    );

    always_comb begin

        case (BCD_in)          //  8'bABC_DEFG_H
	        4'd0:       sevenSeg = 8'b000_0001_1;
            4'd1:       sevenSeg = 8'b100_1111_1;
            4'd2:       sevenSeg = 8'b001_0010_1;
            4'd3:       sevenSeg = 8'b000_0110_1;
            4'd4:       sevenSeg = 8'b100_1100_1;
            4'd5:       sevenSeg = 8'b010_0100_1;
            4'd6:       sevenSeg = 8'b010_0000_1;
            4'd7:       sevenSeg = 8'b000_1111_1;
            4'd8:       sevenSeg = 8'b000_0000_1;
            4'd9:       sevenSeg = 8'b000_1100_1;
            default:    sevenSeg = 8'b111_1111_1;
        endcase
    end
endmodule
