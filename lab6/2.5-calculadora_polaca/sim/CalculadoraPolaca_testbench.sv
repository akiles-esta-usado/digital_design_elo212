`timescale 1ns / 1ps

localparam WIDTH = 16;

typedef struct packed {
    logic [WIDTH-1:0] data_in;
    logic [0:3]       loads;
} in_s;

typedef struct packed{
    logic [6:0] segments;
    logic [7:0] anodes;
} out_s;
localparam period            = 10;     // duración de un periodo
localparam n_periods         = 10;     // Cantidad de ciclos a realizar luego del reset
localparam reset_duration    = 2.2;    // Razón respecto al periodo

module CalculadoraPolaca_testbench();
  
  	logic clk, rst, PB;
    logic pressed;
    logic [3:0] flags;

    CalculadoraPolaca DUT_polaca(
        .clk                (clk),
        .rst                (rst),
        .PB                 (PB), 
        .data_in    (in.data_in),
        .i_load_A     (in.loads[0]),
        .i_load_B     (in.loads[1]),
        .i_load_Op    (in.loads[2]),
        .i_update_Res (in.loads[3]),
    );
    
    always #(period*0.5) clk = ~clk;
	
	initial begin
		clk = 1'b0;
		rst = 1'b0;
        #(period*reset_duration);
		PB = 1'b0;
		#60 rst = 1'b1;
        #30 rst = 1'b0;
		#50 PB = 1'b1;
		#100 PB = 1'b0;
		#50 PB = 1'b1;
		#3  PB = 1'b0;
		#20 PB = 1'b1;
		#80 PB = 1'b0;
	end

    initial begin
        #(period * reset_duration);

        #(period);
        in.data_in = 'h11;
        in.loads[0] = 1;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h11;
        in.loads[0] = 0;
        in.loads[1] = 1;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h00;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 1;
        in.loads[3] = 0;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 1;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period * 8);

        // h22 + h22
        #(period);
        in.data_in = 'h22;
        in.loads[0] = 1;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h11;
        in.loads[0] = 0;
        in.loads[1] = 1;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period);
        in.data_in = 'h01;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 1;
        in.loads[3] = 0;

        #(period);
        in.data_in = 4'h00;
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 1;

        #(period);
        in.loads[0] = 0;
        in.loads[1] = 0;
        in.loads[2] = 0;
        in.loads[3] = 0;

        #(period * 8);
        
        $finish;
    end

endmodule
