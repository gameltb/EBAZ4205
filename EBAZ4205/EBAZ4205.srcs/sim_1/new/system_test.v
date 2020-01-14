`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/14 14:03:46
// Design Name: 
// Module Name: system_test
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


module system_test(
    );
    reg CLK,RST,RXD;
    system test (   .clk(CLK),
                    .resetn_i(RST),
                    .rxd(RXD));

   // Note: CLK must be defined as a wire when using this method

   parameter PERIOD = 10;

   initial begin
      CLK = 1'b0;
      RST = 1'b1;
      RXD = 1'b0;
      #(PERIOD/2);
      forever
         #(PERIOD/2) CLK = ~CLK;
   end
				
			
endmodule
