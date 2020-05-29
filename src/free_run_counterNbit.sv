`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2020 23:15:36
// Design Name: 
// Module Name: free_run_counterNbit
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


module free_run_counterNbit #(parameter N=8)(
    input logic clk, reset,
    output logic max_tick,
    output logic [N-1:0] y
    );
    logic [N-1:0] r_reg;
    logic [N-1:0] r_next;
    
    always_ff @(posedge clk, posedge reset)//logica para sabeer cuando reiniciar el contador
        if(reset) begin
            r_reg <= 0;
        end
        else begin
            r_next <= r_reg + 1; //contador + 1
            end
            
    assign y=r_reg;
    assign max_tick = (r_reg ==2**N-1) ? 1'b1: 1'b0;
endmodule
