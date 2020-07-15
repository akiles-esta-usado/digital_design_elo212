`timescale 1ns / 1ps

module BCD_to_seven_seg(
    input  logic [3:0] i_BCD,
    output logic [6:0] o_seven_seg
    );

    always_comb begin
        o_seven_seg = 7'b_111_111_1;

        case (i_BCD)            // 'b_ABC_DEF_G;
	        'h0:     o_seven_seg = 'b_000_000_1;
            'h1:     o_seven_seg = 'b_100_111_1;
            'h2:     o_seven_seg = 'b_001_001_0;
            'h3:     o_seven_seg = 'b_000_011_0;
            'h4:     o_seven_seg = 'b_100_110_0;
            'h5:     o_seven_seg = 'b_010_010_0;
            'h6:     o_seven_seg = 'b_010_000_0;
            'h7:     o_seven_seg = 'b_000_111_1;
            'h8:     o_seven_seg = 'b_000_000_0;
            'h9:     o_seven_seg = 'b_000_110_0;
            'ha:     o_seven_seg = 'b_000_100_0;
            'hb:     o_seven_seg = 'b_110_000_0;
            'hc:     o_seven_seg = 'b_011_000_1;
            'hd:     o_seven_seg = 'b_100_001_0;
            'he:     o_seven_seg = 'b_011_000_0;
            'hf:     o_seven_seg = 'b_011_100_0;

        endcase

    end

endmodule