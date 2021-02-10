`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 18:46:09
// Design Name: 
// Module Name: test
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


module test(
    input clock,
    input reset,
    output reg out
    );
reg flop1;
reg flop2;
always @ (posedge reset or posedge clock)
    if (reset) begin
        flop1 <= 0;
        flop2 <= 1;
    end else begin
        flop1 <= flop2;
        flop2 <= flop1;
        out <= flop2 ^ flop1;
    end
endmodule
