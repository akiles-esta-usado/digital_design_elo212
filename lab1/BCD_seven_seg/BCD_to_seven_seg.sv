`timescale 1ns / 1ps

module BCD_to_seven_seg(
    input  logic [3:0] i_BCD,
    output logic [6:0] o_seven_seg
    );

    always_comb begin
        o_seven_seg              = 'b_111_1111; // 7F

        case (i_BCD)            // 'b_GFE_DCBA;
            'h0:     o_seven_seg = 'b_100_0000; // 40
            'h1:     o_seven_seg = 'b_111_1001; // 79
            'h2:     o_seven_seg = 'b_010_0100; // 24
            'h3:     o_seven_seg = 'b_011_0000; // 30
            'h4:     o_seven_seg = 'b_001_1001; // 19
            'h5:     o_seven_seg = 'b_001_0010; // 12
            'h6:     o_seven_seg = 'b_000_0010; // 02
            'h7:     o_seven_seg = 'b_111_1000; // 78
            'h8:     o_seven_seg = 'b_000_0000; // 00
            'h9:     o_seven_seg = 'b_001_1000; // 18
            'ha:     o_seven_seg = 'b_000_1000; // 08
            'hb:     o_seven_seg = 'b_000_0011; // 03
            'hc:     o_seven_seg = 'b_100_0110; // 46
            'hd:     o_seven_seg = 'b_010_0001; // 21
            'he:     o_seven_seg = 'b_000_0110; // 06
            'hf:     o_seven_seg = 'b_000_1110; // 0E
        endcase
    end
endmodule