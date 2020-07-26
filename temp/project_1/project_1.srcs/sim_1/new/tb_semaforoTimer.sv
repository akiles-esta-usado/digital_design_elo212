`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2020 03:56:27
// Design Name: 
// Module Name: tb_semaforoTimer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_semaforoTimer();
  
    // We need to give values at the inputs, so we define them as registers  
	logic clock;
	logic reset;
	logic TA, TB;
	
	//The outputs are wires. We don't connect them to anything, but we need to 
	// declare them to visualize them in the output timing diagram
	logic [1:0] LA, LB;
	// an instance of the Device Under Test
	semaforoTimer DUT(
        .clock (clock),
        .reset (reset),
        .TA (TA),
        .TB (TB),
        .LA (LA),
        .LB (LB)
        );
            
	// generate a clock signal that inverts its value every five time units
	always  #10 clock=~clock;
	
	//here we assign values to the inputs
	initial begin
		clock = 1'b0;
		reset = 1'b1;
		TA = 1'b1;
		TB = 1'b0;
		#40 TB = 1'b1;
		#10 reset = 1'b0;
		
		
		#38 TA = 1'b0;
		    
		
		#206 TB = 1'b0;
		#302 TA = 1'b1;
		#40 TB = 1'b1;
	end

endmodule
