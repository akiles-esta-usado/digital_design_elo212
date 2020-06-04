`timescale 1ns / 1ps

module BCD_to_seven_seg(
    input  logic [3:0] i_BCD,
    output logic [7:0] o_seven_seg
    );

    always_comb begin

        case (i_BCD)        //  8'b_ABC_DEF_G_DP;
	        4'h0:     o_seven_seg = 8'b_000_000_1_1;
            4'h1:     o_seven_seg = 8'b_100_111_1_1;
            4'h2:     o_seven_seg = 8'b_001_001_0_1;
            4'h3:     o_seven_seg = 8'b_000_011_0_1;
            4'h4:     o_seven_seg = 8'b_100_110_0_1;
            4'h5:     o_seven_seg = 8'b_010_010_0_1;
            4'h6:     o_seven_seg = 8'b_010_000_0_1;
            4'h7:     o_seven_seg = 8'b_000_111_1_1;
            4'h8:     o_seven_seg = 8'b_000_000_0_1;
            4'h9:     o_seven_seg = 8'b_000_110_0_1;
            4'h5:     o_seven_seg = 8'b_010_010_0_1;
            4'h6:     o_seven_seg = 8'b_010_000_0_1;
            4'h7:     o_seven_seg = 8'b_000_111_1_1;
            4'h8:     o_seven_seg = 8'b_000_000_0_1;
            4'h9:     o_seven_seg = 8'b_000_110_0_1;
            4'hA:     o_seven_seg = 8'b_000_100_0_1;
            4'hB:     o_seven_seg = 8'b_110_000_0_1;
            4'hC:     o_seven_seg = 8'b_011_000_1_1;
            4'hD:     o_seven_seg = 8'b_100_001_0_1;
            4'hE:     o_seven_seg = 8'b_011_000_0_1;
            4'hF:     o_seven_seg = 8'b_011_100_0_1;
            default:  o_seven_seg = 8'b_111_111_1_1;

        endcase

    end

endmodule